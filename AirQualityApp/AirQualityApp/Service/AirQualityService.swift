//
//  AirQualityService.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import Foundation

class AirQualityService {
    let baseURL = "http://api.airvisual.com/v2/city"
    let apiKey = "49db2218-adeb-479e-931a-fe90b7a79d1c"

    func getCityAirQuality(state: String, city: String, completion: @escaping (AirQuality?, Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)?state=\(state)&city=\(city)&key=\(apiKey)") else {
            completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let airQuality = try decoder.decode(AirQuality.self, from: data)
                    completion(airQuality, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }.resume()
    }
}

