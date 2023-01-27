//
//  Weather.swift
//  WeatherForecastPotsdamBekirKus
//
//  Created by Bekir Kus on 25.01.23.
//

import Foundation

// created a struct for using data in Global Struct
// made the Weather struct Identifiable with an unique id for performance reasons
struct Weather: Identifiable {
    
    let id = UUID()
    let day: String
    let value: String
    let detail: String
    let image: String
}
