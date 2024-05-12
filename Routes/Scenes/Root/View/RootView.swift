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
                    .presentationSheet()
                    .interactiveDismissDisabled(true)
                    
            })
            .sheet(isPresented: $rootVM.showStop, content: {
                StopView()
                    .presentationSheet()
            })
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
