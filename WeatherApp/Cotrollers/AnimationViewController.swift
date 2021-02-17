//
//  AnimationViewController.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 15.02.2021.
//  Copyright © 2021 Kodal, Ilayda(AWF). All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "Image")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        self.view.addBackground()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:{
            self.animate()
        })
    }
    private func animate(){
        UIView.animate(withDuration: 1, animations:  {
            let size = self.view.frame.size.width * 3
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            self.imageView.frame = CGRect(x: -(diffx/2),
                                          y: diffy/2,
                                          width: size,
                                          height: size)
        })
        
        UIView.animate(withDuration: 1.5, animations:  {
            self.imageView.alpha = 0
        });
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:  {
            self.performSegue(withIdentifier: "segue", sender: self)
        })
        
    }
}

extension UIView {
    func addBackground() {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Background")
        
        
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
