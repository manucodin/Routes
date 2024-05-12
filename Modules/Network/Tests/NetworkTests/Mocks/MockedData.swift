//
//  MockedData.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class MockedData {
    internal static func readDataFromFile(fileName: String) -> Data? {
        guard let path = Bundle.module.path(forResource: fileName, ofType: "json") else { return nil }
        
        do {
            let fileUrl = URL(fileURLWithPath: path)

            return try Data(contentsOf: fileUrl, options: .mappedIfSafe)
        } catch {
            return nil
        }
    }
}
