//
//  StopInfoDataSource.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

protocol StopsDataSource {
    func obtainStopInfo(id: Int) async throws -> StopInfo?
}
