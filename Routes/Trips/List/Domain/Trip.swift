//
//  Trip.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

public struct Trip: Hashable, Equatable {
    let driverName: String
    let status: TripStatus
    let route: String
    let startTime: Date
    let origin: Destination
    let description: String
    let destination: Destination
    let stops: [Stop]
    let endTime: Date
}
