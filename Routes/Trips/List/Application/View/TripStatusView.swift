//
//  TripStatusView.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import SwiftUI

struct TripStatusView: View {
    let viewModel: TripStatusViewModel
    
    init(status: TripStatus) {
        self.viewModel = TripStatusViewModel(status: status)
    }
    
    var body: some View {
        Text(viewModel.text)
            .font(.caption)
            .foregroundStyle(viewModel.textColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(RoundedRectangle(cornerRadius: 4)
                .foregroundColor(viewModel.backgroundColor))
    }
}

#Preview {
    TripStatusView(status: .ongoing)
}
