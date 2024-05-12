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
        case .invalidText: return String(localized: "invalid_text", bundle: .module)
        case .invalidPhone: return String(localized: "invalid_phone", bundle: .module)
        case .invalidEmail: return String(localized: "invalid_email", bundle: .module)
        }
    }
}
