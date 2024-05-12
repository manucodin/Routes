//
//  TripsAPIClient.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

public protocol TripsAPIClient {
    func obtainTrips() async throws -> [TripDTO]
}
