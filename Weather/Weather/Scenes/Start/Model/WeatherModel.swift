//
//  WeatherModel.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation
import UIKit

enum WeatherModel {

    //MARK: Request
    ///view -> interactor

    struct Request {

    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let weather: Weather
        let icon: UIImage
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let weather: Weather
        let icon: UIImage
    }
}
