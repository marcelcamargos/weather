//
//  WeatherConfigurator.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class WeatherConfigurator {
    static func configure(viewController: WeatherViewController) {
        let router = WeatherRouter()
        let presenter = WeatherPresenter(viewController)
        let interactor = WeatherInteractor(presenter)
        viewController.router = router
        viewController.interactor = interactor
        router.viewController = viewController
    }
}
