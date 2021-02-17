//
//  WeatherResponse.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 10.11.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

struct Main: Decodable {
    let feels_like: Double
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let description: String
    let icon: String
}

struct WeatherResponse: Decodable {
    let main: Main
    let weather: [Weather]
}
