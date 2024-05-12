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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StopView(stopInfo: .test)
        .environmentObject(RootViewModel())
}
