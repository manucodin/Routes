//
//  NetworkClientImpl.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation
import Alamofire

class NetworkClientImpl: NetworkClient {
    private let sessionManager: Session
    
    init(configuration: URLSessionConfiguration = NetworkClientConfiguration.defaultConfiguration) {
        self.sessionManager = Session(configuration: configuration)
    }
    
    func get<R: Codable>(service: APIServiceRepresentable) async throws -> R {
        do {
            return try await sessionManager.request(service.path, method: .get).validate().serializingDecodable(R.self).value
        } catch {
            throw NetworkError.networkError
        }
    }
}
