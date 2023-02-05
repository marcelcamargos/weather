//
//  IconNetworkServiceDatasource.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import UIKit

protocol IconNetworkServiceDatasource: AnyObject {
    func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ())
}
