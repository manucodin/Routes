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
    
    @Published var showTrips: Bool = true
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        $selectedStop
            .sink { [weak self] selectedStop in
                self?.showTrips = selectedStop == nil
            }
            .store(in: &cancellables)
    }
}
