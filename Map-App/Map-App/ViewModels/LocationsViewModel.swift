//
//  LocationsViewModel.swift
//  Map-App
//
//  Created by Zeliha Uslu on 30.07.2022.
//

import Foundation

class LocationsViewModel : ObservableObject{
    
    @Published var locations : [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
