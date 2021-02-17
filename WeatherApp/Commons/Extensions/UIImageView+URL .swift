//
//  UIImageView+URL .swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 10.11.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func setImageFromURL(url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
