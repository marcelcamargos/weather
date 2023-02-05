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
            success(weather)
            
        } fail: { (message) in
            fail(message)
        }
    }
}
