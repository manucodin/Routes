//
//  PointDTO.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

public struct PointDTO: Codable {
    public let latitude: Double?
    public let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
}
