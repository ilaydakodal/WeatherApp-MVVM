//
//  WeatherViewController.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 20.10.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import UIKit

// View
public class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    var viewModel: WeatherViewModel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        cityTextField?.delegate = self
        submitButton?.isUserInteractionEnabled = false
        submitButton?.alpha = 0.5
        submitButton?.UIButtonStyling()
        bindViewModel()
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && string == " " {
            return false
        }
        if textField.text?.last == " " && string == " " {
            return false
        }
        if string == " " {
            return true
        }
        if string.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil {
            return false
        }
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty{
            submitButton?.isUserInteractionEnabled = true
            submitButton?.alpha = 1.0
        } else {
            submitButton?.isUserInteractionEnabled = false
            submitButton?.alpha = 0.5
        }
        return true
    }
    
    @IBAction func submit(_ sender: UIButton) {
        guard let city = cityTextField.text else {
            return
        }
        showSpinner()
        viewModel.fetchWeather(city: city)
    }
}
    

private extension WeatherViewController {
    
    func bindViewModel() {
        viewModel = WeatherViewModel()
        viewModel.changeHandler = { [weak self] change in
            DispatchQueue.main.async {
                self?.applyChange(change)
            }
        }
    }
    func applyChange(_ change: WeatherViewModel.Change) {
        stopSpinner()
        switch change {
        case .presentation(let presentation):
            tempLabel.text = presentation.tempLabelText
            feelsLikeLabel.text = presentation.feelsLikeLabelText
            tempMaxLabel.text = presentation.tempMaxLabelText
            tempMinLabel.text = presentation.tempMinLabelText
            resultLabel.text = presentation.resultLabelText
            if let iconURL = URL.iconURL(presentation.iconURL){
                iconImageView.setImageFromURL(url: iconURL)
                self.iconImageView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
                self.iconImageView.layer.cornerRadius = 10
            }
        case .alert(let message):
            presentWarningAlert(message)
        }
    }
    
}

