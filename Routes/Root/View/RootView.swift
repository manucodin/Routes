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
        MapView(selectedTrip: $rootVM.selectedTrip)
            .sheet(isPresented: .constant(true), content: {
                TripsView(selectedTrip: $rootVM.selectedTrip)
                    .interactiveDismissDisabled(true)
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
}
