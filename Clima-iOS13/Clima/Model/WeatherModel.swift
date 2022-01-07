//
//  WeatherModel.swift
//  Clima
//
//  Created by Quan's Macbook on 07/01/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityID : Int
    let cityName : String
    let temperature : Float
    
    var temperatureString : String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch self.cityID {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
        }
    }   
}
