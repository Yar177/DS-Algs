//
//  Icon.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/12/21.
//

import Foundation


public enum Icon: String {
    
    case sun = "sun.min.fill"
    case cloudy = "cloud.fill"
    case rain = "cloud.rain.fill"
    case thunderstorm = "cloud.bolt.fill"
    case storm = "wind"
    case snow = "cloud.snow.fill"

    static func systemIconForCondition (condition: String) -> String {
        switch condition {
        case "sun":
            return Icon.sun.rawValue
        case "cloudy":
            return Icon.cloudy.rawValue
        case "rain":
            return Icon.rain.rawValue
        case "thunderstrom":
            return Icon.thunderstorm.rawValue
        case "storm":
            return Icon.storm.rawValue
        case "snow":
            return Icon.snow.rawValue
        default:
            return Icon.sun.rawValue
        }
    }
    
}

