//
//  NetworkClient.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

internal protocol NetworkClient {
    func get<R: Codable>(service: APIServiceRepresentable) async throws -> R
}
