//
//  StopViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class StopViewModel: ObservableObject {
    
    @Published var stopInfo: StopInfo? = nil
    
    private let dataSource: StopInfoDataSource
    
    init(dataSource: StopInfoDataSource = StopInfoDataSourceImpl()) {
        self.dataSource = dataSource
    }
    
    func obtainStopInfo() {
        Task { @MainActor in
            do {
                self.stopInfo = try await self.dataSource.obtainStopInfo()
            } catch let error {
                handleError(error)
            }
        }
    }
    
    private func handleError(_ error: Error) {
        debugPrint(error)
    }
}
