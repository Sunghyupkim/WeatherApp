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
    
    var model: WeatherModel {
        
        
        return WeatherModel(countryName: name,
                            temp: main.temp.toInt(),
                            conditionDescription: weather.first?.description ?? "" ,
                            conditionId: weather.first?.id ?? 0)
    }
    
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
}


struct WeatherModel {
    let countryName: String
    let temp: Int
    let conditionDescription: String
    let conditionId: Int
    
    var conditionImage: String {
        
        switch conditionId {
        case 200...299:
            return "imThunderstorm"
        case 300...399:
            return "imDrizzle"
        case 500...599:
            return "imRain"
        case 600...699:
            return "imSnow"
        case 700...799:
            return "imAtmosphere"
        case 800:
            return "imClear"
        default:
            return "imClouds"
        }
    }
    
    
}
