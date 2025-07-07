//
//  WeatherResponse.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 2.07.2025.
//

struct WeatherResponse: Codable {
      let main: Main?
      let weather: [Weather]
      let wind: Wind?
  }
