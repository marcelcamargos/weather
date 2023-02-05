//
//  WeatherNetworkServiceDatasource.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol WeatherNetworkServiceDatasource: AnyObject {
    func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ())
}
