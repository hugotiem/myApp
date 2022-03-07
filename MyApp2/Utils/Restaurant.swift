//
//  Restaurant.swift
//  MyApp2
//
//  Created by Thomas RIVIERE on 05/03/2022.
//

import Foundation
import CoreLocation

class Restaurant {
    var id : String!
        var name : String!
        var address: String!
        var tags : [String]!
        var coordonnes: Coordinate!

    public init(id:String, name:String, address:String, tags:[String],coordonnes: Coordinate){
            self.id = id
            self.name = name
            self.address = address
            self.tags = tags
            self.coordonnes = coordonnes
        }
    
    func getCoordinate() -> CLLocation {
        return CLLocation(latitude: coordonnes.latitude, longitude: coordonnes.longitude)
    }
    
}

