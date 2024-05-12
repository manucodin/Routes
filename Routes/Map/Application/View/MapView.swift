//
//  MapView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var rootVM: RootViewModel
    @StateObject var viewModel = MapViewModel()
    
    @State private var cameraBounds: MapCameraBounds = .init(centerCoordinateBounds: .world)
    
    var body: some View {
        Map(bounds: cameraBounds) {
            MapPolyline(coordinates: viewModel.route)
                .stroke(.route, lineWidth: 5)
        }
        .onChange(of: rootVM.selectedTrip) { _, newValue in
            viewModel.selectedTrip = newValue
        }
    }
}

#Preview {
    MapView()
}

