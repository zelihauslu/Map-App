//
//  LocationsViewModel.swift
//  Map-App
//
//  Created by Zeliha Uslu on 30.07.2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject{
    
    @Published var locations : [Location]
    
    //current location on map
    @Published var mapLocation : Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }

    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
        
    }
    
    private func updateMapRegion(location : Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}
