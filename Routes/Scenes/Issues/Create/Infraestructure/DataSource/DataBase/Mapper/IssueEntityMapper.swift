//
//  IssueEntityMapper.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class IssueEntityMapper {
    static func map(_ issue: Issue) -> IssueEntity {
        return IssueEntity(name: issue.name, surname: issue.surname, email: issue.email, phone: issue.phone, date: issue.date, message: issue.message)
    }
    
    static func map(_ entity: IssueEntity) -> Issue {
        return Issue(name: entity.name, surname: entity.surname, email: entity.email, phone: entity.phone, date: entity.date, message: entity.message)
    }
}
