//
//  MyWeatherView.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/19/21.
//

import UIKit
import SwiftUI

class MyWeatherView: View {
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
        let
    }

}
