//
//  CustomRoundedTextField.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import SwiftUI

struct CustomRoundedTextField: View {
    var text: String
    var value: Binding<String>
    
    var body: some View {
        TextField(text, text: value)
            .multilineTextAlignment(.trailing)
            .autocorrectionDisabled()
            .roundedTextField()
    }
}

#Preview {
    CustomRoundedTextField(text: "Text", value: .constant(""))
}
