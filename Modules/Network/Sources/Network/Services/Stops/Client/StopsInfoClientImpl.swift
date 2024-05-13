//
//  StopsInfoClientImpl.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public class StopsInfoClientImpl: StopsInfoClient {
    
    private let networkClient: NetworkClient
    
    public init() {
        self.networkClient = NetworkClientImpl()
    }
    
    internal init(networkClient: NetworkClient = NetworkClientImpl(configuration: NetworkClientConfiguration.testingConfiguration)) {
        self.networkClient = networkClient
    }
    
    public func obtainStopInfo() async throws -> StopInfoDTO {
        return try await networkClient.get(service: StopsAPIService.stops)
    }
}
