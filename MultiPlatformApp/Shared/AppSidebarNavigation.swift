//
//  AppSidebarNavigation.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/19/21.
//

import SwiftUI

struct AppSidebarNavigation: View {
    enum NavigationItem{
        case myWeather
        case settings
    }
    
    @State private var selection: Set<NavigationItem> = [.myWeather]
    
    var sidebar: some View{
        List(selection: $selection){
            NavigationLink(destination: MyWeatherView()){
                Label("My Weather", systemImage: "thermometer.sun.fill")
            }
            .accessibility(label: Text("My Weather"))
            .tag(NavigationItem.myWeather)
        }
    }
    
    var body: some View {
        NavigationView{
            //sidebar
            
            //myWeatherView
            MyWeatherView()
            //detailView
            Text("Select a day")
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
