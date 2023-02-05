//
//  Weather.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class Weather: Codable {
    let consolidated_weather: [ConsolidatedWeather]
    let time: String
    let sun_rise: String
    let sun_set: String
    let timezone_name: String
    let parent: Parent
    let sources: [Source]
    let title: String
    let location_type: String
    let woeid: Int
    let latt_long: String
    let timezone: String
    
    init(consolidated_weather: [ConsolidatedWeather],
         time: String,
         sun_rise: String,
         sun_set: String,
         timezone_name: String,
         parent: Parent,
         sources: [Source],
         title: String,
         location_type: String,
         woeid: Int,
         latt_long: String,
         timezone: String) {
        self.consolidated_weather = consolidated_weather
        self.time = time
        self.sun_rise = sun_rise
        self.sun_set = sun_set
        self.timezone_name = timezone_name
        self.parent = parent
        self.sources = sources
        self.title = title
        self.location_type = location_type
        self.woeid = woeid
        self.latt_long = latt_long
        self.timezone = timezone
    }
}
