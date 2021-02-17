//
//  Config.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 7.12.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation

extension URL {
    static func urlForWeatherAPI(city: String) -> URL! {
        return URL(string: ApiKey.baseURL + "data/2.5/weather?q=\(city.replacingOccurrences(of: " ", with: "%20"))&APPID=\(ApiKey.appId)&units=metric")
    }
    
    static func iconURL(_ icon: String) -> URL? {
        return URL(string: ApiKey.iconBaseURL + "img/wn/\(icon)@2x.png")
    }
}

struct ApiKey {
    static let appId = "6d4facad58a1eff00ba5e1a5d65b258a"
    static let baseURL = "https://api.openweathermap.org/"
    static let iconBaseURL = "http://openweathermap.org/"
    static let unitMetric = "metric"
}
