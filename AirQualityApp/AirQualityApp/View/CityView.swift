//
//  CityView.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var viewModel: AirQualityViewModel
    
    var body: some View {
        VStack {
            if let quality = viewModel.airQuality {
                Text("City: \(quality.data.city)")
                Text("State: \(quality.data.state)")
                Text("Country: \(quality.data.country)")
                Text("AQI: \(quality.data.current.pollution.aqius)")
            } else {
                Text("Fetching data...")
            }
        }
        .onAppear {
            viewModel.fetchNearestCityAirQuality()
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AirQualityViewModel()
        viewModel.airQuality = AirQuality.example
        return CityView(viewModel: viewModel)
    }
}
