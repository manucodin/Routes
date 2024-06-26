//
//  StopInfoDataSourceImpl.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Network

class StopsDataSourceImpl: StopsDataSource {
    
    private let stopsInfoAPIClient: StopsInfoClient
    
    internal init(stopsInfoAPIClient: StopsInfoClient = StopsInfoClientImpl()) {
        self.stopsInfoAPIClient = stopsInfoAPIClient
    }
    
    func obtainStopInfo(id: Int) async throws -> StopInfo? {
        return StopInfoDTOMapper.map(try await stopsInfoAPIClient.obtainStopInfo())
    }
}
