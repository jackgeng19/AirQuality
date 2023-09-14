//
//  AirQualityViewModel.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import Foundation

class AirQualityViewModel: ObservableObject {
    @Published var airQuality: AirQuality?
    @Published var airQualityList = AirQualityList()
    private var service = AirQualityService()
    @Published var states: [String] = []
    @Published var cities: [String] = []
    var statesAndCities: [String: [String]] = [:]
    
    init() {
        if let fetchedStatesAndCities = LocationService().fetchUSStatesAndCities() {
            self.statesAndCities = fetchedStatesAndCities
            self.states = Array(fetchedStatesAndCities.keys).sorted()
            if let firstState = states.first {
                self.cities = fetchedStatesAndCities[firstState] ?? []
            }
        }
    }

    func fetchNearestCityAirQuality() {
        service.getNearestCityAirQuality { [weak self] (quality, error) in
            DispatchQueue.main.async {
                if let quality = quality {
                    self?.airQuality = quality
                    self?.airQualityList.airQualityItems.append(quality)
                } else {
                    // Handle the error appropriately
                    print("Error fetching air quality: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
}
