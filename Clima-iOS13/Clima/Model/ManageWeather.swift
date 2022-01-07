//
//  ManageWeather.swift
//  Clima
//
//  Created by Quan's Macbook on 05/01/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(manageWeather : ManageWeather , weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct ManageWeather {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=27641f36eb61f2588881c0c6b39ffc63&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    var delegate : WeatherManagerDelegate?
    
    func performRequest(urlString : String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseData(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(manageWeather: self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseData(weatherData : Data ) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodeData.weather[0].id
            let name = decodeData.name
            let temp = decodeData.main.temp
            
            let weather = WeatherModel(cityID: id, cityName: name, temperature: temp)
            return weather

        } catch {
            delegate?.didFailWithError(error: error)
            return nil 
        }
        
    }
    
    
    
}
