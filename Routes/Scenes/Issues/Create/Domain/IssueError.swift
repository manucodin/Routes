//
//  IssueError.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

enum IssueError: Error {
    case fieldError(field: String, message: String?)
    case fieldsError(message: String)
    
    public var errorDescription: String? {
        switch self {
        case .fieldError(let field, let message): 
            return String(format: String(localized: "invalid_field_error_with_message"), field, message ?? "error")
        case .fieldsError(let message):
            return message
        }
    }
}
