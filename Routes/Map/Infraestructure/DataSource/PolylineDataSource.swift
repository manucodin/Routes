//
//  PolylineDataSource.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation
import CoreLocation

protocol PolylineDataSource {
    func obtainPolyline(_ rawValue: String) -> [CLLocationCoordinate2D]
}
