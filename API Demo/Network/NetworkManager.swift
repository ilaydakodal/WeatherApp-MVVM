//
//  NetworkManager.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 3.12.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation
import UIKit

final class WeatherDataManager {
    
    private init() { }
    
    static let shared = WeatherDataManager()
    
    public func getData<T: Decodable>(url: URL?, completion: @escaping ((NetworkResult<T>) -> Void)) {
        guard let url = url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard error == nil else {
                completion(.failure(.failedSession))
                return
            }
            if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode(T.self, from: data)
                        completion(.success(decoded))
                    } catch {
                        completion(.failure(.invalidResponse))
                    }
                } else if response.statusCode == 404 {
                    completion(.failure(.invalidEntry))
                    print("Error Code: \(response.statusCode)")
                } else if response.statusCode == 429{
                    completion((.failure(.exceedingCallAllowance)))
                    print("Error Code: \(response.statusCode)")
                }
            } else {
                completion(.failure(.unknown))
            }
        }
        task.resume()
    }
}
