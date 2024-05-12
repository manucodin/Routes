//
//  StopInfoPointDTO.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public struct StopInfoPointDTO: Codable {
    public let latitude: Double?
    public let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
}
