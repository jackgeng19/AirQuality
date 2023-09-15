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

    func fetchCityAirQuality(state: String, city: String) {
        service.getCityAirQuality(state: state, city: city) { [weak self] (quality, error) in
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
