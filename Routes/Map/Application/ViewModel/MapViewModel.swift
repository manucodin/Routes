//
//  MapViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Combine
import CoreLocation
import MapKit

class MapViewModel: ObservableObject {
    @Published var selectedTrip: Trip?
    @Published var route: [CLLocationCoordinate2D] = []
    
    private var cancellables: Set<AnyCancellable> = []

    private let polylineDataSource: PolylineDataSource
    
    init(polylineDataSource: PolylineDataSource = PolylineDataSourceImpl()) {
        self.polylineDataSource = polylineDataSource
        
        setupObservables()
    }
    
    private func setupObservables() {
        $selectedTrip
            .compactMap({ $0 })
            .sink { [weak self] trip in
                self?.calculateRoute(trip)
            }
            .store(in: &cancellables)
    }
    
    private func calculateRoute(_ trip: Trip) {
        route = polylineDataSource.obtainPolyline(trip.route)
    }
}
