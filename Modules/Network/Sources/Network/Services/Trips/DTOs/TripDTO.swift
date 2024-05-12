//
//  TripDTO.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

public struct TripDTO: Codable {
    public let driverName: String?
    public let status: String?
    public let route: String?
    public let startTime: String?
    public let origin: DestinationDTO?
    public let description: String?
    public let destination: DestinationDTO?
    public let stops: [StopDTO]?
    public let endTime: String?
}
