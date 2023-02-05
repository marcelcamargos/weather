//
//  WeahterViewController.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import UIKit

class WeatherViewController: UIViewController {
    public var interactor: WeatherInteractorDelegate?
    public var router: WeatherInternalRouterDelegate?
    private var errorMessage: String = ""
    public var contentView: WeatherView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        contentView = WeatherView()
        view = contentView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showSpinner()
        interactor?.fetchWeather()
    }
}

extension WeatherViewController: WeatherViewControllerDelegate {
    func presenter(didSuccessShowWeather presenterToView: WeatherModel.ViewModel) {
        contentView?.cityTitleLabel.text = presenterToView.weather.title
        contentView?.someImageView.image = presenterToView.icon
        contentView?.postTitleContentLabel.text = "\(Int(presenterToView.weather.consolidated_weather[3].the_temp))°"
        contentView?.descriptionLabel.text = presenterToView.weather.consolidated_weather[3].weather_state_name
        contentView?.valueLowTemperatureLabel.text = "\(Int(presenterToView.weather.consolidated_weather[3].min_temp))°"
        contentView?.valueHighTemperatureLabel.text = "\(Int(presenterToView.weather.consolidated_weather[3].max_temp))°"
        
        self.removeSpinner()
    }
    
    func presenter(didFailShowWeather message: String) {
        errorMessage = message
        self.removeSpinner()
        print("didFailShowWeather")
    }
}
