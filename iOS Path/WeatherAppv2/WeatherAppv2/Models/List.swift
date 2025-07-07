//
//  List.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 7.07.2025.
//

import Foundation

struct Daily: Codable {
    let dt: Int
    let temp: Temperature
    let feels_like: FeelsLike
    let weather: [Weather]
}
