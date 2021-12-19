//
//  AppTabNavigation.swift
//  MultiPlatformApp (iOS)
//
//  Created by Hoshiar Sher on 12/19/21.
//

import SwiftUI

struct AppTabNavigation: View {
    enum Tab{
        case myWeather
        case settings
    }
    
    @State private var selection: Tab = .myWeather
    
    
    var body: some View {
        TabView(selection: $selection){
            NavigationView{
                MyWeatherView()
            }.tabItem{
                Label("My Weather", systemImage: "thermometer.sun.fill")
                    .accessibility(label: Text("My Weather"))
            }.tag(Tab.myWeather)
            
            NavigationView{
                MyWeatherView()
            }.tabItem{
                Label("My Weather", systemImage: "gear")
                    .accessibility(label: Text("Settings"))
            }.tag(Tab.settings)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
