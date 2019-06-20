//
//  NetworkProcessor.swift
//  Weathery
//
//  Created by Ashley Herbert on 6/19/19.
//  Copyright © 2019 Ashley Herbert. All rights reserved.
//

import Foundation

class NetworkProcessor
{
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    init(url: URL)
    {
        self.url = url
    }
    
    typealias  JSONDictionaryHandler = (([String: Any]?) ->  Void)
    
    func downloadJSONFromURL(_ completion: @escaping JSONDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { ( data, response, error) in
            
            if error == nil {
                
                if let httpResponce = response as? HTTPURLResponse {
                    switch httpResponce.statusCode {
                    case 200:
                    //successful responce
                        if let data = data{
                            do{
                                
                            let jsonDictionary = try JSONSerialization.jsonObject(with:
                                data, options: .mutableContainers)
                                
                                completion(jsonDictionary as? [String: Any])
                                
                            } catch let error as NSError{
                                print("Error processing json data: \(error.localizedDescription)")
                            }
                        }
                    
                    default:
                        print("HTTP Responce Code: \(httpResponce.statusCode)")
                }
                
                }
            }else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
        dataTask.resume()
    }
    
}




























