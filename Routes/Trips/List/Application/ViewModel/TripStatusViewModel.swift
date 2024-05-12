//
//  TripStatusViewModel.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation
import SwiftUI

class TripStatusViewModel {
    
    var text: String {
        switch status {
        case .ongoing: return String(localized: "ongoing")
        case .scheduled: return String(localized: "scheduled")
        case .finalized: return String(localized: "finalized")
        case .cancelled: return String(localized: "cancelled")
        case .unknowed: return String(localized: "unknowed")
        }
    }
    
    var textColor: Color {
        switch status {
        case .ongoing: return Color(.ongoingPillText)
        case .scheduled: return Color(.scheduledPillText)
        case .finalized: return Color(.finalizedPillText)
        case .cancelled: return Color(.cancelledPillText)
        case .unknowed: return Color.black
        }
    }
    
    var backgroundColor: Color {
        switch status {
        case .ongoing: return Color(.ongoingPillBackground)
        case .scheduled: return Color(.scheduledPillBackground)
        case .finalized: return Color(.finalizedPillBackground)
        case .cancelled: return Color(.cancelledPillBackground)
        case .unknowed: return Color.white
        }
    }
    
    private let status: TripStatus
    
    init(status: TripStatus) {
        self.status = status
    }
}
