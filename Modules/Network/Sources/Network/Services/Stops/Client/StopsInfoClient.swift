//
//  StopsInfoClient.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public protocol StopsInfoClient {
    func obtainStopInfo() async throws -> StopInfoDTO
}
