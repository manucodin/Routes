//
//  IssueViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Combine
import Utils

class IssueViewModel: ObservableObject {
    @Published var issue = Issue()
    
    @Published var saved: Bool = false
    
    @Published var showAlert: Bool = false
    @Published var message: String = ""
        
    var requiredFieldsCompleted: Bool {
        guard issue.name.isEmpty == false else { return false }
        guard issue.surname.isEmpty == false else { return false }
        guard issue.email.isEmpty == false else { return false }
        guard issue.message.isEmpty == false else { return false }
        
        return true
    }
    
    func sendIssue() {
        do {
            try validate()
            try save()
        } catch let error {
            showError(error)
        }
    }
    
    private func showError(_ error: Error) {
        showAlert = true
        message = error.localizedDescription
    }
    
    private func validate() throws {
        let errors = [validateName(), validateSurname(), validateEmail(), validatePhone()].compactMap({ $0 })
        
        if errors.isEmpty {
            return
        }
        
        let message = errors.map({ $0.localizedDescription }).joined(separator: "\n")
        
        throw IssueError.fieldsError(message: message)
    }
    
    private func validateName() -> IssueError? {
        guard let error = NameValidator().validate(issue.name) else { return nil }
     
        return IssueError.fieldError(field: String(localized: "name"), message: error.localizedDescription)
    }
    
    private func validateSurname() -> IssueError? {
        guard let error = NameValidator().validate(issue.surname) else { return nil }
        
        return IssueError.fieldError(field: String(localized: "surname"), message: error.localizedDescription)
    }
    
    private func validateEmail() -> IssueError? {
        guard let error = EmailValidator().validate(issue.email) else { return nil }
        
        return IssueError.fieldError(field: String(localized: "email"), message: error.localizedDescription)
    }
    
    private func validatePhone() -> IssueError? {
        guard !issue.phone.isEmpty else { return nil }
        guard let error = PhoneValidator().validate(issue.phone) else { return nil }

        return IssueError.fieldError(field: String(localized: "phone"), message: error.localizedDescription)
    }
    
    private func save() throws {
        debugPrint("Save into local")
    }
}
