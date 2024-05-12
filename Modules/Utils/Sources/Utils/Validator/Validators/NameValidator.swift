//
//  NameValidator.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public class NameValidator: Validator {
    
    public init() {}
    
    public var regex: String {
        return #"^[a-zA-Z\s]*$"#
    }
    
    public func validate(_ input: String) -> ValidatorError? {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input) == false ? .invalidText : nil
    }
}
