//
//  StopViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftUI

class StopInfoViewModel: ObservableObject {
    
    var statusTextColor: Color {
        switch stopInfo.paid {
        case true: return Color(.ongoingPillText)
        case false: return Color(.cancelledPillText)
        }
    }
    
    var statusBackgroundColor: Color {
        switch stopInfo.paid {
        case true: return Color(.ongoingPillBackground)
        case false: return Color(.cancelledPillBackground)
        }
    }
    
    var statusText: String {
        switch stopInfo.paid {
        case true: String(localized: "Paid")
        case false: String(localized: "Not paid")
        }
    }
    
    var address: String {
        return stopInfo.address
    }
    
    var userName: String {
        return stopInfo.userName
    }
    
    var price: String {
        return "\(stopInfo.price)$"
    }
    
    private let stopInfo: StopInfo
    
    init(stopInfo: StopInfo) {
        self.stopInfo = stopInfo
    }
}
