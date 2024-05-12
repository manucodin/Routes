//
//  MapView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    @Binding var selectedTrip: Trip?
    
    @State private var cameraBounds: MapCameraBounds = .init(centerCoordinateBounds: .world)
    
    var body: some View {
        Map(bounds: cameraBounds) {
            MapPolyline(coordinates: viewModel.route)
                .stroke(.route, lineWidth: 5)
        }
        .onChange(of: selectedTrip) { oldValue, newValue in
            viewModel.selectedTrip = newValue
        }
        .onChange(of: viewModel.route) { _, _ in
            cameraBounds = MapCameraBounds(centerCoordinateBounds: viewModel.boundingRect)
        }
    }
}

#Preview {
    MapView(selectedTrip: .constant(nil))
}

