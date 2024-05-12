//
//  ValidatorError.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public enum ValidatorError: Error {
    case invalidText
    case invalidPhone
    case invalidEmail
    
    public var errorDescription: String? {
        switch self {
        case .invalidText: return String(localized: "invalid_text")
        case .invalidPhone: return String(localized: "invalid_phone")
        case .invalidEmail: return String(localized: "invalid_email")
        }
    }
}
