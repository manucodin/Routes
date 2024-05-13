//
//  TripMapper.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Network
import Utils

class TripDTOMapper {
    static func map(_ dto: TripDTO) -> Trip? {
        guard let origin = mapDestinationModel(dto.origin) else { return nil }
        guard let destination = mapDestinationModel(dto.destination) else { return nil }
        guard let route = dto.route else { return nil }
        
        return Trip(
            driverName: dto.driverName ?? "",
            status: TripStatus(rawValue: dto.status),
            route: route,
            startTime: dto.startTime?.toDate(format: DateFormat.dtoFormat.rawValue) ?? Date(),
            origin: origin,
            description: dto.description ?? "",
            destination: destination,
            stops: dto.stops?.compactMap({ mapStop($0) }) ?? [],
            endTime: dto.endTime?.toDate(format: DateFormat.dtoFormat.rawValue) ?? Date()
        )
    }
    
    private static func mapDestinationModel(_ dto: DestinationDTO?) -> Destination? {
        guard let point = mapPointModel(dto?.point) else { return nil }
        
        return Destination(point: point, address: dto?.address ?? "")
    }
    
    private static func mapStop(_ dto: StopDTO) -> Stop? {
        guard let id = dto.id else { return nil }
        guard let point = mapPointModel(dto.point) else { return nil }
        
        return Stop(point: point, id: id)
    }
    
    private static func mapPointModel(_ dto: PointDTO?) -> Point? {
        guard let latitude = dto?.latitude else { return nil }
        guard let longitude = dto?.longitude else { return nil }
        
        return Point(latitude: latitude, longitude: longitude)
    }
}
