//
//  WeatherManager.swift
//  Weather
//
//  Created by Sunghyup Kim on 2020/06/12.
//  Copyright © 2020 SunghyupKim. All rights reserved.
//

import Foundation
import Alamofire

struct WeatherManager {
    
    private let API_KEY = "250c589f90a323ebaf48639bd3e6481e"
    
    func fetchWeather(byCity city: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let path = "http://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
        
        let urlString = String(format: path, query, API_KEY)
        
        AF.request(urlString).responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
            
            switch response.result {
            case .success(let weatherData):
                let model = weatherData.model
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
       
     
        
    }
    
    
}
