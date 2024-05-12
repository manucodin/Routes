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
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var selectedTrip: Trip?
    @Published var selectedPoint: Point?
    
    @Published var route: [CLLocationCoordinate2D] = []
    @Published var cameraPosition: MapCameraPosition = .automatic
    
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
        
        $selectedPoint
            .compactMap({ $0 })
            .sink { [weak self] point in
                self?.didSelectPoint(point)
            }
            .store(in: &cancellables)
    }
    
    private func calculateRoute(_ trip: Trip) {
        route = polylineDataSource.obtainPolyline(trip.route)
        centerInCoordinates(route.center())
    }
    
    private func didSelectPoint(_ point: Point) {
        centerInCoordinates(point.coordinates)
    }
    
    private func centerInCoordinates(_ coordinates: CLLocationCoordinate2D) {
        cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)))
    }
}

