//
//  IssueViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class IssueViewModel: ObservableObject {
    
    @Published var issue = Issue()
    @Published var requiredFieldsCompleted: Bool = false
    
    @Published var saved: Bool = false
    
    @Published var showAlert: Bool = false
    @Published var message: String = ""
}
