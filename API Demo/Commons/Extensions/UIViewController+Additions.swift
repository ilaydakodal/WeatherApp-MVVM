//
//  UIViewController+Additions.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 4.01.2021.
//  Copyright © 2021 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func presentWarningAlert(_ message: String) {
        let alertController = UIAlertController(title: "Oops!",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
    
}
