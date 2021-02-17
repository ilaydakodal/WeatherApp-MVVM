//
//  UIViewController+ActivityIndicator.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 15.02.2021.
//  Copyright © 2021 Kodal, Ilayda(AWF). All rights reserved.
//

import UIKit

fileprivate var activityView: UIView?

extension UIViewController{
    func showSpinner(){
        activityView = UIView(frame:  self.view.bounds)
        activityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.4)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityView!.center
        activityIndicator.startAnimating()
        activityView?.addSubview(activityIndicator)
        self.view.addSubview(activityView!)
    }
    
    func stopSpinner(){
        activityView?.removeFromSuperview()
        activityView = nil
    }
}
