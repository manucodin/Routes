//
//  PresentationSheetModifier.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftUI

struct PresentationSheetModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(160), .medium])
            .presentationBackgroundInteraction(
                .enabled(upThrough: .medium)
            )
    }
}

extension View {
    func presentationSheet() -> some View {
        modifier(PresentationSheetModifier())
    }
}
