//
//  WeatherViewControllerDelegate.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol WeatherViewControllerDelegate: AnyObject {
    func presenter(didSuccessShowWeather presenterToView: WeatherModel.ViewModel)
    func presenter(didFailShowWeather message: String)
}
