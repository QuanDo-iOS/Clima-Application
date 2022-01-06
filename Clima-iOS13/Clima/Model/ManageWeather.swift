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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseData(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseData(weatherData : Data ) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.main.temp)
            print(decodeData.weather[0].description)
        } catch {
            print(error)
        }
        
    }
    
}
