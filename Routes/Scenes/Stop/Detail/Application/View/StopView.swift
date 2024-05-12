//
//  StopView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct StopView: View {
    @EnvironmentObject var rootVM: RootViewModel

    let viewModel: StopInfoViewModel
    
    init(stopInfo: StopInfo) {
        self.viewModel = StopInfoViewModel(stopInfo: stopInfo)
    }
    
    var body: some View {
        HStack (alignment: .top) {
            VStack (alignment: .leading) {
                Text(viewModel.address)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(viewModel.userName)
            }
            Spacer()
            VStack {
                Text(viewModel.price)
                    .font(.title2)
                PillTextView(
                    text: viewModel.statusText,
                    textColor: viewModel.statusTextColor,
                    backgroundColor: viewModel.statusBackgroundColor
                )
            }
        }
    }
}

#Preview {
    StopView(stopInfo: .test)
        .environmentObject(RootViewModel())
}
