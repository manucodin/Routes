//
//  IssueEntity.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftData

@Model
final class IssueEntity {
    
    @Attribute(.unique)
    var id: String
    
    var name: String
    var surname: String
    var email: String
    var phone: String
    var date: Date
    var message: String
    
    init(id: String = UUID().uuidString, name: String, surname: String, email: String, phone: String, date: Date, message: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
        self.phone = phone
        self.date = date
        self.message = message
    }
    
}
