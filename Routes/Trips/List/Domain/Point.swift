//
//  Point.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation
import CoreLocation

struct Point: Hashable {
    
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    let latitude: Double
    let longitude: Double
}
