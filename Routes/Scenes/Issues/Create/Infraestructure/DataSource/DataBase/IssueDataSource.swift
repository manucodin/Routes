//
//  IssuesDataSource.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

protocol IssuesDataSource {
    func save(_ issue: Issue) throws
}
