////
////  AirQuality.swift
////  AirQualityApp
////
////  Created by Qicheng Geng on 9/14/23.
////
//
//import Foundation
//
//struct AirQuality: Codable {
//    let status: String
//    let data: AirQualityData
//}
//
//struct AirQualityData: Codable {
//    let city: String
//    let state: String
//    let country: String
//    let location: Location
//    let current: CurrentData
//}
//
//struct Location: Codable {
//    let type: String
//    let coordinates: [Double]
//}
//
//struct CurrentData: Codable {
//    let pollution: PollutionData
//    let weather: WeatherData
//}
//
//struct PollutionData: Codable {
//    let ts: String
//    let aqius: Int
//    let mainus: String
//    let aqicn: Int
//    let mainxcn: String
//}
//
//struct WeatherData: Codable {
//    let ts: String
//    let tp: Int
//    let pr: Int
//    let hu: Int
//    let ws: Double
//    let wd: Int
//    let ic: String
//}
//
//extension AirQuality {
//    static var example: AirQuality {
//        AirQuality(
//            status: "success",
//            data: AirQualityData(
//                city: "Chapel Hill",
//                state: "North Carolina",
//                country: "USA",
//                location: Location(
//                    type: "Point",
//                    coordinates: [-79.035728, 35.932522]
//                ),
//                current: CurrentData(
//                    pollution: PollutionData(
//                        ts: "2023-09-14T18:00:00.000Z",
//                        aqius: 29,
//                        mainus: "p2",
//                        aqicn: 9,
//                        mainxcn: "p2"
//                    ),
//                    weather: WeatherData(
//                        ts: "2023-09-14T18:00:00.000Z",
//                        tp: 27,
//                        pr: 1016,
//                        hu: 63,
//                        ws: 0.45,
//                        wd: 84,
//                        ic: "01d"
//                    )
//                )
//            )
//        )
//    }
//}
//
//class AirQualityList {
//    var airQualityItems: [AirQuality] = []
//}
