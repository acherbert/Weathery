//
//  ForcastService.swift
//  Weathery
//
//  Created by Ashley Herbert on 6/19/19.
//  Copyright © 2019 Ashley Herbert. All rights reserved.
//

import Foundation

class ForcastService
{
    let forcastAPIKey: String
    let forcastBaseURL: URL?
    
    init(APIKey: String)
    {
        self.forcastAPIKey = APIKey
        forcastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let forcastURL = URL(string: "\(forcastBaseURL!)/\(latitude), \(longitude)")
            {
            
            let networkProcessor = NetworkProcessor(url: forcastURL)
            networkProcessor.downloadJSONFromURL({ (jsonDictionary)in
                if let currentWeatherDictionary = jsonDictionary? ["currently"] as?
                    [String: Any]{
                    let currentWeather = CurrentWeather(weatherDictionary:
                        currentWeatherDictionary)
                    completion(currentWeather)
                }else{
                    completion(nil)
                }
                
            })
        }
    }
}

