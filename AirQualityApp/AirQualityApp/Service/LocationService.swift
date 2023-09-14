//
//  LocationService.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import Foundation

class LocationService {
    func fetchUSStatesAndCities() -> [String: [String]]? {
        if let url = Bundle.main.url(forResource: "US_States_and_Cities", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let statesAndCities = try decoder.decode([String: [String]].self, from: data)
                return statesAndCities
            } catch {
                print("Error decoding US_States_and_Cities.json: \(error)")
            }
        }
        return nil
    }
}

