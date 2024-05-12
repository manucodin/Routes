//
//  TripsDataSourceImpl.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation
import Network

class TripsDataSourceImpl: TripsDataSource {
    
    private let tripsAPIClient: TripsAPIClient
    
    internal init(tripsAPIClient: TripsAPIClient = TripsAPIClientImpl()) {
        self.tripsAPIClient = tripsAPIClient
    }
    
    func obtainTrips() async throws -> [Trip] {
        return try await tripsAPIClient.obtainTrips().compactMap({ TripMapper.map($0) })
    }
}
