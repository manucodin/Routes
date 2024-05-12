//
//  RootView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootVM: RootViewModel
        
    var body: some View {
        MapView()
            .sheet(isPresented: $rootVM.showTrips, content: {
                TripsView()
                    .interactiveDismissDisabled(true)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(160), .medium])
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .medium)
                    )
                    
            })
            .sheet(isPresented: $rootVM.showStop, content: {
                StopView()
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(160), .medium])
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .medium)
                    )
            })
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
