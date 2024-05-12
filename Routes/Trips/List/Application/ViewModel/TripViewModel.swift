//
//  TripViewModel.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation

class TripViewModel {
    
    var originText: String {
        return String(localized: "From: \(trip.origin.address)")
    }
    
    var destinationText: String {
        return String(localized: "To: \(trip.destination.address)")
    }
    
    var durationText: String? {
        guard let time = Date.calculateTimeBetweenDates(starteDate: trip.startTime, endDate: trip.endTime) else {
            return nil
        }

        return String(localized: "Estimated time: \(time)")
    }
    
    var status: TripStatus {
        return trip.status
    }
    
    private let trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
    }
}
