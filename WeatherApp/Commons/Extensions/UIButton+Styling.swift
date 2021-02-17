//
//  UIButton+Styling.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 3.12.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func UIButtonStyling() {
        setTitleColor(.gray, for: .highlighted)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        layer.cornerRadius = 35
    }
}
