//
//  WeatherData.swift
//  Clima
//
//  Created by Quan's Macbook on 06/01/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct WeatherData : Codable {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Float
}

struct Weather : Codable {
    let description : String
    let id : Int
}
