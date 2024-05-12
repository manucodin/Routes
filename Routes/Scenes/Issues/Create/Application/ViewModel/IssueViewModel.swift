//
//  IssueViewModel.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Combine
import Utils
import SwiftData

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
    
    private let issueDataSource: IssuesDataSource
    
    init(issueDataSource: IssuesDataSource = IssuesDataSourceImpl()) {
        self.issueDataSource = issueDataSource
    }
    
    func sendIssue(_ modelContext: ModelContext) {
        do {
            try validate()
            try save(modelContext)
        } catch let error as IssueError {
            showErrorMessage(error.errorDescription ?? error.localizedDescription)
        } catch let error {
            showErrorMessage(error.localizedDescription)
        }
    }
    
    private func showErrorMessage(_ errorMessage: String) {
        showAlert = true
        message = errorMessage
    }
    
    private func validate() throws {
        let errors = [validateName(), validateSurname(), validateEmail(), validatePhone()].compactMap({ $0 })
        
        if errors.isEmpty {
            return
        }
        
        let message = errors.compactMap({ $0.errorDescription }).joined(separator: "\n")
        
        throw IssueError.fieldsError(message: message)
    }
    
    private func validateName() -> IssueError? {
        guard let error = NameValidator().validate(issue.name) else { return nil }
     
        return IssueError.fieldError(field: String(localized: "name"), message: error.errorDescription)
    }
    
    private func validateSurname() -> IssueError? {
        guard let error = NameValidator().validate(issue.surname) else { return nil }
        
        return IssueError.fieldError(field: String(localized: "surname"), message: error.errorDescription)
    }
    
    private func validateEmail() -> IssueError? {
        guard let error = EmailValidator().validate(issue.email) else { return nil }
        
        return IssueError.fieldError(field: String(localized: "email"), message: error.errorDescription)
    }
    
    private func validatePhone() -> IssueError? {
        guard !issue.phone.isEmpty else { return nil }
        guard let error = PhoneValidator().validate(issue.phone) else { return nil }

        return IssueError.fieldError(field: String(localized: "phone"), message: error.errorDescription)
    }
    
    private func save(_ modelContext: ModelContext) throws {
        try issueDataSource.save(issue, modelContext: modelContext)
        saved.toggle()
    }
}
