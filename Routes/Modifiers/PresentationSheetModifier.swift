//
//  PresentationSheetModifier.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftUI

struct PresentationSheetModifier: ViewModifier {
    var presentationDetens: Set<PresentationDetent> = [.medium]
    
    func body(content: Content) -> some View {
        content
            .presentationDragIndicator(.visible)
            .presentationDetents(presentationDetens)
            .presentationBackgroundInteraction(
                .enabled(upThrough: .medium)
            )
    }
}

extension View {
    func presentationSheet() -> some View {
        modifier(PresentationSheetModifier())
    }
    
    func presentationSheet(_ detens: Set<PresentationDetent>) -> some View {
        modifier(PresentationSheetModifier(presentationDetens: detens))
    }
}
