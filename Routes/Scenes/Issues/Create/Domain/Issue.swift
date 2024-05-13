//
//  Issue.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

struct Issue {
    var name: String
    var surname: String
    var email: String
    var phone: String
    var date: Date
    var message: String
    
    init(name: String = "", surname: String = "", email: String = "", phone: String = "", date: Date = Date(), message: String = "") {
        self.name = name
        self.surname = surname
        self.email = email
        self.phone = phone
        self.date = date
        self.message = message
    }
}
