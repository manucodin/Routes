//
//  Stop.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation
import CoreLocation

struct Stop: Identifiable, Equatable{
    let point: Point
    let id: Int
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
    }
}
