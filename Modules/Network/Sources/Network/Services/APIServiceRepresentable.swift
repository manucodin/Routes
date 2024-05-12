//
//  APIServiceRepresentable.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation

internal protocol APIServiceRepresentable {
    var baseURL: String { get }
    var path: String { get }
}
