//
//  PolylineDataSourceImpl.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation
import CoreLocation
import Polyline

class PolylineDataSourceImpl: PolylineDataSource {
    func obtainPolyline(_ rawValue: String) -> [CLLocationCoordinate2D] {
        return decodePolyline(rawValue) ?? []
    }
}
