//
//  ConsolidatedWeather.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class ConsolidatedWeather: Codable {
    let id: Int64
    let weather_state_name: String
    let weather_state_abbr: String
    let wind_direction_compass: String
    let created: String
    let applicable_date: String
    let min_temp: Float
    let max_temp: Float
    let the_temp: Float
    let wind_speed: Float
    let wind_direction: Float
    let air_pressure: Float
    let humidity: Int
    let visibility: Float
    let predictability: Int
    
    init(id: Int64, weather_state_name: String, weather_state_abbr: String, wind_direction_compass: String, created: String, applicable_date: String, min_temp: Float, max_temp: Float, the_temp: Float, wind_speed: Float, wind_direction: Float, air_pressure: Float, humidity: Int, visibility: Float, predictability: Int) {
        self.id = id
        self.weather_state_name = weather_state_name
        self.weather_state_abbr = weather_state_abbr
        self.wind_direction_compass = wind_direction_compass
        self.created = created
        self.applicable_date = applicable_date
        self.min_temp = min_temp
        self.max_temp = max_temp
        self.the_temp = the_temp
        self.wind_speed = wind_speed
        self.wind_direction = wind_direction
        self.air_pressure = air_pressure
        self.humidity = humidity
        self.visibility = visibility
        self.predictability = predictability
    }
}
