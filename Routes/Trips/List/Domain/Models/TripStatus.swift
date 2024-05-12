//
//  File.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

enum TripStatus: String, Equatable {
    case ongoing
    case scheduled
    case finalized
    case cancelled
    case unknowed
    
    init(rawValue: String?) {
        switch rawValue {
        case "ongoing": self = .ongoing
        case "scheduled": self = .scheduled
        case "finalized": self = .finalized
        case "cancelled": self = .cancelled
        default: self = .unknowed
        }
    }
}
