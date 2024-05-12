//
//  IssuesDataSource.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import SwiftData

protocol IssuesDataSource {
    func save(_ issue: Issue, modelContext: ModelContext) throws
    func getIssues(_ modelContext: ModelContext) throws -> [Issue]
}
