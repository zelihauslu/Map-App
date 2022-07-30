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
            Map(coordinateRegion: $vm.mapRegion ).ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()

            }
        }
    }
}

extension LocationsView{
    
    private var header: some View{
        VStack{
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title2)
                .foregroundColor(.primary)
                .fontWeight(.black)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading){
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                }
            LocationsListView()
        }.background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
