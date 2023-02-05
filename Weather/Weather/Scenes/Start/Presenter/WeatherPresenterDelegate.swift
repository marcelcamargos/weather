//
//  WeatherPresenterDelegate.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol WeatherPresenterDelegate: AnyObject {
    func interactor(didSuccessShowWeather response: WeatherModel.Response)
    func interactor(didFailShowWeather error: String)
}
