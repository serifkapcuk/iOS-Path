//
//  Forecast.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 9.07.2025.
//

import Foundation
struct Forecast: Codable {
    let dt: TimeInterval
    let main: MainWeather?
    let weather: [Weather]
    
}
