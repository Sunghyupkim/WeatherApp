//
//  WeatherData.swift
//  Weather
//
//  Created by Sunghyup Kim on 2020/06/12.
//  Copyright © 2020 SunghyupKim. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
}
