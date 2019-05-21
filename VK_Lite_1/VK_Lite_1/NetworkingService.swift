//
//  NetworkingService.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 21/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

class NetworkingService {
    public func sendRequest(for city: String) {
        //let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appId=8b32f5f2dc7dbd5254ac73d984baf306")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appId", value: "8b32f5f2dc7dbd5254ac73d984baf306")
        ]
        
        guard let url = urlComponents.url else { fatalError("URL is badly formatted.") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) 
            print(json ?? "")
        }
        
        task.resume()
    }
    
}
