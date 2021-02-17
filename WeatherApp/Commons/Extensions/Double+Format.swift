//
//  Double+Format.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 3.12.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation

extension Double {
    public func toCelciusString() -> String {
        return String(format: "%.0f °C", self)
    }
}

 
