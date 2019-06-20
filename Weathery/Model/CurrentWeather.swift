//
//  CurrentWeather.swift
//  Weathery
//
//  Created by Ashley Herbert on 6/19/19.
//  Copyright © 2019 Ashley Herbert. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys{
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "preciProbability"
        static let summary = "summary"
    }
    
    init(weatherDictionary: [String: Any])
    {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double{
            humidity = Int(humidityDouble * 100)
        }else{
            humidity = nil
        }
        if let precipDoulbe = weatherDictionary[WeatherKeys.precipProbability] as? Double {
           precipProbability = Int(precipDoulbe * 100)
            
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
}




























