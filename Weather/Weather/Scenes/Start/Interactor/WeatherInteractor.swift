//
//  WeatherInteractor.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import UIKit

class WeatherInteractor {
    
    // MARK: - Private Properties
    
    private var presenter: WeatherPresenterDelegate?
    private var weatherWorker: WeatherWorkerDelegate
    private var iconWorker: IconWorkerDelegate
    
    // MARK: - Init
    
    init(_ presenter: WeatherPresenterDelegate?, _ weatherWorker: WeatherWorkerDelegate = WeatherWorker(), _ iconWorker: IconWorkerDelegate = IconWorker()) {
        self.presenter = presenter
        self.weatherWorker = weatherWorker
        self.iconWorker = iconWorker
    }
}

// MARK: - WeatherInteractor

extension WeatherInteractor: WeatherInteractorDelegate {
    func fetchWeather() {
        self.weatherWorker.getWeather { [weak self] (weather) in
            guard let self = self else { return }
            
            self.iconWorker.getIcon(weather_state_abbr: weather.consolidated_weather[3].weather_state_abbr) { [weak self] (icon) in
                guard let self = self else { return }
                let interactorToPresenter = WeatherModel.Response(weather: weather, icon: icon)
                self.presenter?.interactor(didSuccessShowWeather: interactorToPresenter)

            } fail: { (message) in
                self.presenter?.interactor(didFailShowWeather: message)
            }
            
        } fail: { (message) in
            self.presenter?.interactor(didFailShowWeather: message)
        }
    }
}
