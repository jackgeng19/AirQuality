//
//  StateCitySelectionView.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import SwiftUI

struct StateCitySelectionView: View {
    @ObservedObject var viewModel: AirQualityViewModel
    @State private var selectedStateIndex = 0 {
        didSet {
            updateCitiesForSelectedState()
        }
    }
    @State private var selectedCityIndex = 0

    var body: some View {
        VStack {
            Picker("State", selection: $selectedStateIndex) {
                ForEach(0..<viewModel.states.count, id: \.self) { index in
                    Text(viewModel.states[index]).tag(index)
                }
            }
            Picker("City", selection: $selectedCityIndex) {
                ForEach(0..<viewModel.cities.count, id: \.self) { index in
                    Text(viewModel.cities[index]).tag(index)
                }
            }
            Button("Fetch Air Quality") {
                let state = viewModel.states[selectedStateIndex]
                let city = viewModel.cities[selectedCityIndex]
            }
        }
        .onAppear {
            updateCitiesForSelectedState()
        }
    }

    func updateCitiesForSelectedState() {
        if let selectedState = viewModel.states[safe: selectedStateIndex] {
            viewModel.cities = viewModel.statesAndCities[selectedState] ?? []
            selectedCityIndex = 0  // Reset city index when state changes
        }
    }
}


extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


struct StateCitySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AirQualityViewModel()
        StateCitySelectionView(viewModel: viewModel)
    }
}
