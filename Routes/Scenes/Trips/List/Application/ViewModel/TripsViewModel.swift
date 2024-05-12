//
//  TripsViewModel.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

final class TripsViewModel: ObservableObject {
    @Published private (set) var trips: [Trip] = []
    
    private let dataSource: TripsDataSource
    
    init(dataSource: TripsDataSource = TripsDataSourceImpl()) {
        self.dataSource = dataSource
    }

    func obtainTrips() {
        Task { @MainActor in
            do {
                self.trips = try await dataSource.obtainTrips()
            } catch let error {
                handleError(error)
            }
        }
    }
    
    private func handleError(_ error: Error) {
        debugPrint(error)
    }
}
