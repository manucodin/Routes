//
//  TripsDataSource.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

protocol TripsDataSource {
    func obtainTrips() async throws -> [Trip]
}
