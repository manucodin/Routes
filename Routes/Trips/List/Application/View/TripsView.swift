//
//  SwiftUIView.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import SwiftUI

public struct TripsView: View {
    @Binding var selectedTrip: Trip?
    @StateObject var viewModel = TripsViewModel()
    
    public init(selectedTrip: Binding<Trip?>) {
        self._selectedTrip = selectedTrip
    }
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack (alignment: .leading, spacing: 16) {
                    Text("Routes")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(viewModel.trips) { trip in
                        TripView(trip: trip, isSelected: selectedTrip == trip).onTapGesture {
                            self.selectedTrip = trip
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
            viewModel.obtainTrips()
        }
    }
}

#Preview {
    TripsView(selectedTrip: .constant(nil))
}
