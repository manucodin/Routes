//
//  StringExtensionTests.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import XCTest

@testable import Utils

final class StringExtensionTests: XCTestCase {
    
    func testToDateWithFormat() {
        let dateString: String = "2018-12-18T08:00:00.000Z"
        let format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let value = dateString.toDate(format: format)
        
        XCTAssertFalse(value == Date())
    }
    
    func testToDateWithInvalidFormat() {
        let dateString: String = "2018-12-18T08:00:00.000Z"
        let format: String = "HH:mm:ss"
        
        let value = dateString.toDate(format: format)
        
        XCTAssertNil(value)
    }
}
