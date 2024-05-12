//
//  Trip.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

public struct Trip: Identifiable, Equatable {
    public var id: Int {
        return driverName.hashValue
    }
    
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

extension Trip {
    static var test: Trip {
        return Trip(
            driverName: "Alberto Morales",
            status: .ongoing,
            route: "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@",
            startTime: "2018-12-18T08:00:00.000Z".toDate(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ") ?? Date(),
            origin: Destination(
                point: Point(
                    latitude: 41.38074,
                    longitude: 2.18594
                ),
                address: "Metropolis:lab, Barcelona"
            ),
            description: "Barcelona a Martorell",
            destination: Destination(
                point: Point(
                    latitude: 41.49958,
                    longitude: 1.90307
                ),
                address: "Seat HQ, Martorell"
            ),
            stops: [
                Stop(
                    point: Point(
                        latitude: 41.37653,
                        longitude: 2.17924
                    ),
                    id: 1
                ),
                Stop(
                    point: Point(
                        latitude: 41.35179,
                        longitude: 2.15494
                    ),
                    id: 2
                ),
                Stop(
                    point: Point(
                        latitude: 41.43853,
                        longitude: 2.00094
                    ),
                    id: 3
                ),
                Stop(
                    point: Point(
                        latitude: 41.47711,
                        longitude: 1.91843
                    ),
                    id: 4
                )
            ],
            endTime: "2018-12-18T09:00:00.000Z".toDate(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ") ?? Date()
        )
    }
}
