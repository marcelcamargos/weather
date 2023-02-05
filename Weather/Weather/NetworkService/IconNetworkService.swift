//
//  IconNetworkService.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation
import UIKit

class IconNetworkService: IconNetworkServiceDatasource {
    
    func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://cdn.faire.com/static/mobile-take-home/icons/\(weather_state_abbr).png")
        
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                fail("Error with fetching icon")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                fail("Error with the response, unexpected status code")
                return
            }
            
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                success(image)
            }
        })
        
        task.resume()
    }
}
