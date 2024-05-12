//
//  StopInfoDataSource.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

protocol StopInfoDataSource {
    func obtainStopInfo() async throws -> StopInfo?
}
