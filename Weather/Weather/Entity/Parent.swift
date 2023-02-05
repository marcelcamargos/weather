//
//  Parent.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class Parent: Codable {
    let title: String
    let location_type: String
    let woeid: Int32
    let latt_long: String
    
    init(title: String,
         location_type: String,
         woeid: Int32,
         latt_long: String) {
        self.title = title
        self.location_type = location_type
        self.woeid = woeid
        self.latt_long = latt_long
    }
}
