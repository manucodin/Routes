//
//  StopsViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class StopsViewModel: ObservableObject {
    
    @Published var selectStopInfo: StopInfo? = nil

    private let stopsDataSource: StopsDataSource
    
    init(stopsDataSource: StopsDataSource = StopsDataSourceImpl()) {
        self.stopsDataSource = stopsDataSource
    }
    
    func obtainStopInfo(id: Int) {
        Task { @MainActor in
            do {
                self.selectStopInfo = try await stopsDataSource.obtainStopInfo(id: id)
            } catch let error {
                handleError(error)
            }
        }
    }
    
    private func handleError(_ error: Error) {
        debugPrint(error)
    }
}
