//
//  RootView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootVM: RootViewModel
    @StateObject var stopsVM = StopsViewModel()
    
    var body: some View {
        NavigationStack {
            MapView { stop in
                rootVM.showTrips = false
                stopsVM.obtainStopInfo(id: stop.id)
            }
            .navigationTitle("Routes")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $rootVM.showTrips, content: {
                TripsView()
                    .presentationSheet([.height(160), .medium])
                    .interactiveDismissDisabled(true)
            })
            .sheet(item: $stopsVM.selectStopInfo) {
                rootVM.showTrips = true
                stopsVM.selectStopInfo = nil
            } content: { stopInfo in
                StopView(stopInfo: stopInfo)
                    .presentationSheet([.height(80)])
            }
            .navigationDestination(isPresented: $rootVM.createIssue, destination: {
                IssueView()
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {
                            rootVM.showTrips = false
                            stopsVM.selectStopInfo = nil
                            rootVM.createIssue = true
                        }, label: {
                            Button(action: {}, label: {
                                Label(
                                    title: { Text("createIssue") },
                                    icon: { Image(systemName: "pencil") }
                                )
                            })
                        })
                    } label: {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bell")
                        })
                    }

                }
            })
            .onAppear {
                showTrips()
            }
        }
    }
    
    private func showTrips() {
        rootVM.showTrips = true
        stopsVM.selectStopInfo = nil
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
