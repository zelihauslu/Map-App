//
//  LocationsView.swift
//  Map-App
//
//  Created by Zeliha Uslu on 30.07.2022.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        ZStack{
            mapLayer
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationPreviewStack
            }
        }
    }
}

extension LocationsView{
    
    private var header: some View{
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                            .padding()
                    }
            }
            if vm.showLocationsList{
                LocationsListView()
            }
            
        }.background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }).ignoresSafeArea()
    }
    
    private var locationPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location{
                    LocationsPreviewView(location: location)
                }
            }
            .shadow(color: .black.opacity(0.3), radius: 20)
            .padding()
            .transition(.asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .leading)))
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
