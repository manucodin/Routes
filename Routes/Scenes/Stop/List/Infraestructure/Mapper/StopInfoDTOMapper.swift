//
//  StopInfoDTOMapper.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Network
import Utils

class StopInfoDTOMapper {
    static func map(_ dto: StopInfoDTO) -> StopInfo? {
        guard let tripId = dto.tripId else { return nil }
        guard let point = map(dto.point) else { return nil }
        guard let stopTime = dto.stopTime?.toDate(format: DateFormat.dtoFormat.rawValue) else { return nil }
        
        return StopInfo(
            stopTime: stopTime,
            paid: dto.paid ?? false,
            address: dto.address ?? "",
            tripId: tripId,
            userName: dto.userName ?? "",
            point: point,
            price: String(format: "%.2f", dto.price ?? 0)
        )
    }
    
    private static func map(_ dto: StopInfoPointDTO?) -> StopInfoPoint? {
        guard let latitude = dto?.latitude else { return nil }
        guard let longitude = dto?.longitude else { return nil }
        
        return StopInfoPoint(latitude: latitude, longitude: longitude)
    }
}
