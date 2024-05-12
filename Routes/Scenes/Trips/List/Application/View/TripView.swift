//
//  TripView.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import SwiftUI
import Utils

struct TripView: View {
    let viewModel: TripViewModel
    let isSelected: Bool
    
    init(trip: Trip, isSelected: Bool) {
        self.viewModel = TripViewModel(trip: trip)
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(viewModel.originText)
                Text(viewModel.destinationText)
                HStack {
                    PillTextView(
                        text: viewModel.pillStatusViewModel.text,
                        textColor: viewModel.pillStatusViewModel.textColor,
                        backgroundColor: viewModel.pillStatusViewModel.backgroundColor
                    )
                    if let durationText = viewModel.durationText {
                        Text(durationText)
                            .font(.caption)
                    }
                    EmptyView()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(isSelected ? .selectedCellBackground : .cellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    TripView(trip: .test, isSelected: false)
}
