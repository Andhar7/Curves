//
//  ContentView.swift
//  Curves
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model : ItemViewModel
    @State private var selection : Tab = .home
    
    enum Tab {
        case home
        case slider
    }
    var body: some View {
        
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Curves", systemImage: "star")
                }
                .tag(Tab.home)
            
            CarouselSlider()
                .tabItem {
                    Label("Cool Slider", systemImage: "list.bullet")
                }
                .tag(Tab.slider)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ItemViewModel())
    }
}
