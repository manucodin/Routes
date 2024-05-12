//
//  StopInfo.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

struct StopInfo: Identifiable, Equatable {
    var id: String {
        return "\(tripId)"
    }
    
    let stopTime: Date
    let paid: Bool
    let address: String
    let tripId: Int
    let userName: String
    let point: StopInfoPoint
    let price: String
}
