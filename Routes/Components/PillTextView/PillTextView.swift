//
//  PillTextView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct PillTextView: View {
    
    let text: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundStyle(textColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(RoundedRectangle(cornerRadius: 4)
                .foregroundColor(backgroundColor))
    }
}

#Preview {
    PillTextView(text: "Test", textColor: .ongoingPillText, backgroundColor: .ongoingPillBackground)
}
