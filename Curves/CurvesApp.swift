//
//  CurvesApp.swift
//  Curves
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

@main
struct CurvesApp: App {
    @StateObject var model = ItemViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
