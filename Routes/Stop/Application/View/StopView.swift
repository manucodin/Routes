//
//  StopView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct StopView: View {
    @EnvironmentObject var rootVM: RootViewModel
    @StateObject var stopVM = StopViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                stopVM.obtainStopInfo()
            }
            .onDisappear {
                rootVM.selectedStop = nil
            }
    }
}

#Preview {
    StopView()
        .environmentObject(RootViewModel())
}
