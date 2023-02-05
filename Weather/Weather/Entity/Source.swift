//
//  Source.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

class Source: Codable {
    let title: String
    let slug: String
    let url: String
    let crawl_rate: Int
    
    init(title: String, slug: String, url: String, crawl_rate: Int) {
        self.title = title
        self.slug = slug
        self.url = url
        self.crawl_rate = crawl_rate
    }
}
