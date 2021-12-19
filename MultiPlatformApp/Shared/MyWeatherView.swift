//
//  MyWeatherView.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/19/21.
//
//
//  MyWeatherView.swift
//  WeatherEverywhere
//
//  Created by Brian Advent on 08.10.20.
//

import SwiftUI

struct MyWeatherView: View {
    @State private var forecasts = [Forecast]()
    
    @State private var selection:Forecast?
    
    
    var body: some View {
        
       List(selection: $selection) {
            ForEach(forecasts) { forecast in
                NavigationLink(destination: WeatherDetail(forecast: forecast), tag: forecast, selection: $selection) {
                    WeatherRow(forecast: forecast)
                    
                }
                
            }
        }.onAppear(perform: loadData).background(Rectangle().fill(BackgroundStyle()).edgesIgnoringSafeArea(.all))
        .navigationTitle("🌤 Forecast")
    
    }
    
    func loadData(){
        let weatherDataReqeust = DataRequest<WeatherData>(city: "San Francisco")
        
        weatherDataReqeust.getData{ dataResult in
            switch dataResult {
            case .failure:
                print("Could not load weater data")
            case .success(let weatherDataObjects):
                guard let forecastArray = weatherDataObjects.first?.forecast else {return}
                DispatchQueue.main.async {
                    self.forecasts = forecastArray
                }
            
            }
        }
    }
}

struct MyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeatherView()
    }
}
