//
//  Validator.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

public protocol Validator {
    var regex: String { get }
    
    func validate(_ input: String) -> ValidatorError?
}
