//
//  ManageWeather.swift
//  Clima
//
//  Created by Quan's Macbook on 05/01/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct ManageWeather {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=27641f36eb61f2588881c0c6b39ffc63&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
