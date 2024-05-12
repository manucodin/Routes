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
    @StateObject var mapVM = MapViewModel()
    
    @State private var position = MapCameraPosition.automatic
    
    var body: some View {
        Map(position: $mapVM.cameraPosition) {
            MapPolyline(coordinates: mapVM.route)
                .stroke(.route, lineWidth: 5)
            
            if let start = mapVM.selectedTrip?.origin {
                Annotation(start.address, coordinate: start.point.coordinates) {
                    AnnotationView(icon: "house.fill").onTapGesture {
                        mapVM.selectedPoint = start.point
                    }
                }
            }
            
            if let stops = mapVM.selectedTrip?.stops {
                ForEach(stops, id: \.self) { stop in
                    Annotation("\(stop.id)", coordinate: stop.point.coordinates) {
                        AnnotationView(icon: "mappin").onTapGesture {
                            mapVM.selectedPoint = stop.point
                        }
                    }
                }
            }
            
            if let destination = mapVM.selectedTrip?.destination {
                Annotation(destination.address, coordinate: destination.point.coordinates) {
                    AnnotationView(icon: "flag.checkered").onTapGesture {
                        mapVM.selectedPoint = destination.point
                    }
                }
            }
        }
        .onChange(of: rootVM.selectedTrip) { _, newValue in
            mapVM.selectedTrip = newValue
        }
    }
}

#Preview {
    MapView()
        .environmentObject(RootViewModel())
}

