//
//  WeatherViewModel.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 3.12.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation

struct WeatherPresenatation {
    let tempLabelText: String
    let feelsLikeLabelText: String
    let tempMaxLabelText: String
    let tempMinLabelText: String
    let resultLabelText: String
    let iconURL: String
}

class WeatherViewModel {
    
    let weatherViewController = WeatherViewController()
    
    enum Change {
        case presentation(presentation: WeatherPresenatation)
        case alert(message: String)
    }
    
    var weather: WeatherResponse!
    
    var changeHandler: ((Change) -> Void)?
    
    func fetchWeather(city: String) {
        
        WeatherDataManager.shared.getData(url: URL.urlForWeatherAPI(city: city)) { (result: NetworkResult<WeatherResponse>) in
            switch result {
            case .success(let response):
                self.handleResponse(response)
                print(response)
            case .failure(let error):
                self.changeHandler?(.alert(message: "Something Went Wrong \n Error: \(error)"))
            }
        }
    }
   
    func handleResponse(_ response: WeatherResponse){
        let presentation = WeatherPresenatation(tempLabelText: response.main.temp.toCelciusString(),
                                                feelsLikeLabelText: response.main.feels_like.toCelciusString(),
                                                tempMaxLabelText:response.main.temp_max.toCelciusString(),
                                                tempMinLabelText: response.main.temp_min.toCelciusString(),
                                                resultLabelText: response.weather[0].description,
                                                iconURL: response.weather[0].icon)
        
        changeHandler?(.presentation(presentation: presentation))
        
    }
}

