//
//  Global.swift
//  WeatherForecastPotsdamBekirKus
//
//  Created by Bekir Kus on 25.01.23.
//


import Foundation

// using data from Weather Struct
// created an array for using the values later in content view
let weatherArray = [
    Weather(day: "Mon", value: "6° C", detail: "Cloudy", image: "cloud.sun"),
    Weather(day: "Tue", value: "5° C", detail: "Mostly Clear", image: "cloud.sun"),
    Weather(day: "Wed", value: "7° C", detail: "Foggy", image: "cloud.sun"),
    Weather(day: "Thu", value: "6° C", detail: "Mostly Cloudy", image: "cloud"),
    Weather(day: "Fri", value: "3° C", detail: "Rainy", image: "cloud.rain"),
    Weather(day: "Sat", value: "2° C", detail: "Rainy", image: "cloud.rain"),
    Weather(day: "Sun", value: "3° C", detail: "Mostly Cloudy", image: "cloud")
        
]

let currentWeather = Weather(day: "Now", value: "2° C", detail: "Mostly Cloudy", image: "cloud")
