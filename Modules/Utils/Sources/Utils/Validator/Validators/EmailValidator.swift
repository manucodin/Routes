//
//  EmailValidator.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public class EmailValidator: Validator {
    
    public init() {}
    
    public var regex: String {
        return #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
    }
    
    public func validate(_ input: String) -> ValidatorError? {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input) == false ? .invalidEmail : nil
    }
}
