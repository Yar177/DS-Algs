//
//  WeatherData.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/12/21.
//

import Foundation

struct WeatherData: Decodable, Identifiable{
    
    var id: String
    var forecast: [Forecast]
}
