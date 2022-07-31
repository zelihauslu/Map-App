//
//  Location.swift
//  Map-App
//
//  Created by Zeliha Uslu on 30.07.2022.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    
    //Objects in the same location can cause problems
   // let ID = UUID().uuidString
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    var id: String{
        name + cityName
    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

