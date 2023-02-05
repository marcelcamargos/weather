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
            
            let interactorToPresenter = WeatherModel.Response(weather: weather)
            self.presenter?.interactor(didSuccessShowWeather: interactorToPresenter)
            self.fetchIcon(weatherStateAbbr: weather.consolidated_weather[3].weather_state_abbr)
            
        } fail: { (message) in
            self.presenter?.interactor(didFailShowWeather: message)
        }
    }
    
    func fetchIcon(weatherStateAbbr: String) {
        self.iconWorker.getIcon(weather_state_abbr: weatherStateAbbr) { [weak self] (icon) in
            guard let self = self else { return }
            let interactorToPresenter = IconModel.Response(icon: icon)
            self.presenter?.interactor(didSuccessShowIcon: interactorToPresenter)
            
        } fail: { (message) in
            self.presenter?.interactor(didFailShowIcon: message)
        }
    }
}
