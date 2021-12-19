//
//  MyWeatherView.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/19/21.
//

import UIKit
import SwiftUI

struct MyWeatherView: View {
    @State private var forecast =  [Forecast]()
    @State private var selection: Forecast?
    
    var body: some View{
        List(selection: $selection){
            ForEach(forecast) { forecast in
                NavigationLink(destination: WeatherDetail(forecast: forecast), tag: forecast, selection: $selection){
                    WeatherRow(forecast: forecast)
                }
            }
        }.onAppear(perform: loadData)
            .background(Rectangle().fill(BackgroundStyle()).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("🌤 Forecast")
    }
    
    func loadData(){
        let weatherDataRequest = DataRequest<WeatherData>(city: "San Francisco")
        
        weatherDataRequest.getData { dataResults in
            switch dataResults{
            case .failuer:
                print("Could not load weather data")
            case .success(let weatherDataObject):
                guard let forcastArray = weatherDataObject.first?.forecast else {return}
                DispatchQueue.main.async {
                    self.forecast = forcastArray
                }
            }
        }
    }

}


struct MyWeatherView_Previews: PreviewProvider{
    static var previews: some View{
        MyWeatherView()
    }
}
