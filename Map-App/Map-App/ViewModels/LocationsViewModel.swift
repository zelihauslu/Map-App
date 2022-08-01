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

    //current region
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //show list of locations
    @Published var showLocationsList : Bool = false
    
    //show location detail via sheet
    @Published var sheetLocation : Location? = nil
    
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
    
    func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location : Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed(){
        //get the current index
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            print("Could not founc current index!")
            return
        }
        
        //check if the current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            // next index is not valid
            //restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        //next index  is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
