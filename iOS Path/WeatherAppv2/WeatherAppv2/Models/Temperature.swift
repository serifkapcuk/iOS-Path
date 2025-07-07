//
//  Temperature.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 4.07.2025.
//

import Foundation

struct Temperature : Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}
