//
//  Forecast.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/12/21.
//

import Foundation

struct Forecast: Decodable, Hashable, Identifiable{
    
    var id: UUID = UUID()
    var date: String
    var temp_min: Float
    var temp_max: Float
    var condition_name: String
    var condition_desc: String
    
    
    init(date: String, temp_min:Float, temp_max: Float, conditionName:String, conditionDesc: String){
        self.date = date
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.condition_name = conditionName
        self.condition_desc = conditionDesc
    }
    
    
    init(from decoder: Decoder) throws {
        id = UUID()
        let containr = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try containr.decode(String.self, forKey: .date)
        self.temp_min = try containr.decode(Float.self, forKey: .temp_min)
        self.temp_max = try containr.decode(Float.self, forKey: .temp_max)
        self.condition_name = try containr.decode(String.self, forKey: .condition_name)
        self.condition_desc = try containr.decode(String.self, forKey: .condtion_desc)
    }
    
    enum CodingKeys: String, CodingKey{
        case date
        case temp_min
        case temp_max
        case condition_name
        case condtion_desc
    }
    
}
