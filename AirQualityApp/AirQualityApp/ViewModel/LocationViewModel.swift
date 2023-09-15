//
//  LocationViewModel.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import Foundation
import SwiftUI
import Combine

class LocationViewModel: ObservableObject {
    @Published var states: [States] = sampleStates
    @Published var selectedState: States? = nil
    @Published var selectedCity: String? = nil
}
