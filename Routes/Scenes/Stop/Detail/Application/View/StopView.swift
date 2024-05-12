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
        ZStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(viewModel.address)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(viewModel.userName)
                }
                Spacer()
                VStack (spacing: 0){
                    Text(viewModel.price)
                        .font(.title3)
                    PillTextView(
                        text: viewModel.statusText,
                        textColor: viewModel.statusTextColor,
                        backgroundColor: viewModel.statusBackgroundColor
                    )
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    StopView(stopInfo: .test)
        .environmentObject(RootViewModel())
}
