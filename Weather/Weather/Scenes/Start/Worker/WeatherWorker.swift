//
//  WeatherWorker.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class WeatherWorker: WeatherWorkerDelegate {
    // MARK: - Private Properties
    
    private var service: WeatherNetworkServiceDatasource
    
    // MARK: - Init
    
    init(_ service: WeatherNetworkServiceDatasource = WeatherNetworkService()) {
        self.service = service
    }
    
    func getWeather(success: @escaping (Weather) -> (), fail:@escaping (String) -> ()) {
        service.getWeather { (weather) in
            
            if weather.title.isEmpty || weather.consolidated_weather.isEmpty || weather.consolidated_weather.count < 4 {
                fail("Weather information was not fetched or should have at least four consolidated weather information.")
            } else {
                success(weather)
            }
            
        } fail: { (message) in
            fail(message)
        }
    }
}
