//
//  RootView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootVM: RootViewModel
    @StateObject var stopsVM = StopsViewModel()
    
    var body: some View {
        MapView { stop in
            rootVM.showTrips = false
            stopsVM.obtainStopInfo(id: stop.id)
        }
        .sheet(isPresented: $rootVM.showTrips, content: {
            TripsView()
                .presentationSheet()
                .interactiveDismissDisabled(true)
        })
        .sheet(item: $stopsVM.selectStopInfo) {
            rootVM.showTrips = true
            stopsVM.selectStopInfo = nil
        } content: { stopInfo in
            StopView(stopInfo: stopInfo)
                .presentationSheet()
        }
            
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
