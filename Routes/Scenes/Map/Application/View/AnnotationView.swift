//
//  AnnotationView.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct AnnotationView: View {
    let icon: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(.annotationBackground)
            Image(systemName: icon)
                .padding(5)
        }
    }
}

#Preview {
    AnnotationView(icon: "flag.checkered")
}
