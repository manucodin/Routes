//
//  Issue.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

struct Issue {
    let name: String
    let surname: String
    let email: String
    let phone: String?
    let date: Date
    let message: String
    
    init(name: String = "", surname: String = "", email: String = "", phone: String? = nil, date: Date = Date(), message: String = "") {
        self.name = name
        self.surname = surname
        self.email = email
        self.phone = phone
        self.date = date
        self.message = message
    }
}
