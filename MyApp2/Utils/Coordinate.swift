//
//  Coordinate.swift
//  MyApp2
//
//  Created by Benjamin GOGO on 05/03/2022.
//

import Foundation
import UIKit
import CoreLocation

class Coordinate {
    
    var longitude: CLLocationDegrees
    var latitude: CLLocationDegrees
    
    public init(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        self.latitude = latitude
        self.longitude = longitude
    }
}
