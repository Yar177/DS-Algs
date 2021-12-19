//
//  WeatherRow.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/19/21.
//

import SwiftUI

struct WeatherRow: View{
    
    
    var forecast: Forecast
    
    var body: some View {
        HStack(alignment: .top) {
            
            Image(systemName:Icon.systemIconForCondition(condition: forecast.condition_name))
                .frame(width: 50, height: 50)
                .accessibility(hidden: true)

            VStack(alignment: .leading) {
                Text(forecast.condition_name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(forecast.condition_desc)
                    .lineLimit(2)
                    
            }
            .padding(.vertical, 8)
            
            Spacer(minLength: 0)
        }
        .font(.subheadline)
        .padding(.vertical, 0)
        .accessibilityElement(children: .combine)
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(forecast: Forecast(date: "11/10/20", temp_min: 10, temp_max: 20, conditionName: "Windy", conditionDesc: "Attention!  It is windy"))
    }
}
