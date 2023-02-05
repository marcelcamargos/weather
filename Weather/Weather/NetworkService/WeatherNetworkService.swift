//
//  WeatherNetworkConnection.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class WeatherNetworkService: WeatherNetworkServiceDatasource {
    
    func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://cdn.faire.com/static/mobile-take-home/4418.json")
        
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                fail("Error with fetching weather")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                fail("Error with the response, unexpected status code")
                return
            }
            
            if let data = data,
               let weather = try? JSONDecoder().decode(Weather.self, from: data) {
                DispatchQueue.main.async {
                    success(weather)
                }
            }
        })
        
        task.resume()
    }
}
