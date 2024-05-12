//
//  TripsAPIService.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

internal enum TripsAPIService: APIServiceRepresentable {
    case trips
    
    var baseURL: String {
        return "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test"
    }
    
    var path: String {
        switch self {
        case .trips: return "\(baseURL)/trips.json"
        }
    }
}
