//
//  TestView.swift
//  AirQualityApp
//
//  Created by Qicheng Geng on 9/14/23.
//

import SwiftUI



struct AirQuality: Codable {
    let status: String
    let data: AirQualityData
}

struct AirQualityData: Codable {
    let city: String
    let state: String
    let country: String
    let location: Location
    let current: CurrentData
}

struct Location: Codable {
    let type: String
    let coordinates: [Double]
}

struct CurrentData: Codable {
    let pollution: PollutionData
    let weather: WeatherData
}

struct PollutionData: Codable {
    let ts: String
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let mainxcn: String
}

struct WeatherData: Codable {
    let ts: String
    let tp: Int
    let pr: Int
    let hu: Int
    let ws: Double
    let wd: Int
    let ic: String
}

struct TestView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
