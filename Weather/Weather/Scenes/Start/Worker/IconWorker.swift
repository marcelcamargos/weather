//
//  IconWorker.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import UIKit

class IconWorker: IconWorkerDelegate {
    // MARK: - Private Properties
    
    private var service: IconNetworkServiceDatasource
    
    // MARK: - Init
    
    init(_ service: IconNetworkServiceDatasource = IconNetworkService()) {
        self.service = service
    }
    
    func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
        service.getIcon(weather_state_abbr: weather_state_abbr) { (icon) in
            success(icon)
        } fail: { (message) in
            fail(message)
        }
    }
}
