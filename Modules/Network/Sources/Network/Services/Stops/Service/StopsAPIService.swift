//
//  StopsAPIService.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

internal enum StopsAPIService: APIServiceRepresentable {
    case stops
    
    var baseURL: String {
        return "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test"
    }
    
    var path: String {
        switch self {
        case .stops: return "\(baseURL)/stops.json"
        }
    }
}
