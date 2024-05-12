//
//  TripsAPIClientImpl.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

public class TripsAPIClientImpl: TripsAPIClient {
    
    private let networkClient: NetworkClient
    
    public init() {
        self.networkClient = NetworkClientImpl()
    }
    
    internal init(networkClient: NetworkClient = NetworkClientImpl()) {
        self.networkClient = networkClient
    }
    
    public func obtainTrips() async throws -> [TripDTO] {
        return try await networkClient.get(service: TripsAPIService.trips)
    }
}
