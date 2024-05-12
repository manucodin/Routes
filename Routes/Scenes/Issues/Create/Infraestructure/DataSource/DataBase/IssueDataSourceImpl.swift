//
//  IssuesDataSourceImpl.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftData

class IssuesDataSourceImpl: IssuesDataSource {
    
    func save(_ issue: Issue, modelContext: ModelContext) throws {
        let entity = IssueEntityMapper.map(issue)
        modelContext.insert(entity)
        try modelContext.save()
    }
    
}
