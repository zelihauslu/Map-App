//
//  Map_AppApp.swift
//  Map-App
//
//  Created by Zeliha Uslu on 30.07.2022.
//

import SwiftUI

@main
struct MapApp: App {
    
    @StateObject private var vm = LocationsViewModel()

    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
