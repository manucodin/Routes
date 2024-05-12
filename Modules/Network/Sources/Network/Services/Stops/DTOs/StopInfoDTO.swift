//
//  StopInfoDTO.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public struct StopInfoDTO: Codable {
    public let stopTime: String?
    public let paid: Bool?
    public let address: String?
    public let tripId: Int?
    public let userName: String?
    public let point: StopInfoPointDTO?
    public let price: Double?
}
