//
//  WeatherWorkerDelegate.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol WeatherWorkerDelegate {
    func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ())
}
