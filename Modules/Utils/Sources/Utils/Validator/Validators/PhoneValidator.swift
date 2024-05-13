//
//  PhoneValidator.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public class PhoneValidator: Validator {
    
    public init() {}
    
    public var regex: String {
        return #"\+?(?:[0-9] ?){6,14}[0-9]$"#
    }
    
    public func validate(_ input: String) -> ValidatorError? {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input) == false ? .invalidPhone : nil
    }
}
