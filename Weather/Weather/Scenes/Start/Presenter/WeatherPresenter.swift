//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class WeatherPresenter {

    // MARK: - Private Properties

    private weak var viewController: WeatherViewControllerDelegate?

    // MARK: - Init

    init(_ viewController: WeatherViewControllerDelegate?) {
        self.viewController = viewController
    }
}

// MARK: - WeatherPresenter

extension WeatherPresenter: WeatherPresenterDelegate {
    func interactor(didSuccessShowWeather response: WeatherModel.Response) {
        let presenterToView = WeatherModel.ViewModel(weather: response.weather, icon: response.icon)
        
        viewController?.presenter(didSuccessShowWeather: presenterToView)
    }
    
    func interactor(didFailShowWeather error: String) {
        viewController?.presenter(didFailShowWeather: error)
    }
}
