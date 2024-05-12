//
//  TextAreaModifier.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftUI

struct TextAreaModifier: ViewModifier {
    let numberOfLines: Int
    
    init(_ numberOfLines: Int) {
        self.numberOfLines = numberOfLines
    }
    
    func body(content: Content) -> some View {
        content.textFieldStyle(.plain).lineLimit(numberOfLines, reservesSpace: true).autocorrectionDisabled()
    }
}

extension View {
    func textArea(numberOfLines: Int = 6) -> some View {
        return modifier(TextAreaModifier(numberOfLines))
    }
}
