//
//  SwiftUIView.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import SwiftUI

public struct TripsView: View {
    @EnvironmentObject var rootVM: RootViewModel
    @StateObject var tripsVM = TripsViewModel()
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack (alignment: .leading, spacing: 16) {
                    Text("Routes")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(tripsVM.trips, id: \.self) { trip in
                        TripView(trip: trip, isSelected: rootVM.selectedTrip == trip).onTapGesture {
                            rootVM.selectedTrip = trip
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding()
            .padding(.vertical, 12)
        }
        .background(Color.gray.opacity(0.1))
        .ignoresSafeArea()
        .task {
            tripsVM.obtainTrips()
        }
    }
}

#Preview {
    TripsView()
        .environmentObject(RootViewModel())
}
