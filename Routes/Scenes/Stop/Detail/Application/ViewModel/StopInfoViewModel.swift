//
//  StopViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class StopInfoViewModel: ObservableObject {
    
    private let stopInfo: StopInfo
    
    init(stopInfo: StopInfo) {
        self.stopInfo = stopInfo
    }
}
