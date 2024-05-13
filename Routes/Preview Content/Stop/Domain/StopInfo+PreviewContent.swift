//
//  StopInfo+PreviewContent.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

extension StopInfo {
    static var test: StopInfo {
        return StopInfo(
            stopTime: "2018-12-18T09:00:00.000Z".toDate(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ") ?? Date(),
            paid: true,
            address: "Ramblas, Barcelona",
            tripId: 1,
            userName: "Manuel Gomez",
            point: StopInfoPoint(
                latitude: 41.37653,
                longitude: 2.17924
            ),
            price: "1.50"
        )
    }
}
