//
//  RooViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Combine

class RootViewModel: ObservableObject {
    @Published var selectedTrip: Trip?
    @Published var selectedStop: Stop?
    @Published var selectedStopInfo: StopInfo?
    
    @Published var showTrips: Bool = true
    @Published var showStop: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        $selectedStop.sink { [weak self] stop in
            self?.showStop = stop != nil
        }.store(in: &cancellables)
    }
}
