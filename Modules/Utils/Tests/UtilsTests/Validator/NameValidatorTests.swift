//
//  NameValidatorTests.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 13/5/24.
//

import XCTest

@testable import Utils

final class NameValidatorTests: XCTestCase {

    private var sut: NameValidator!
    
    override func setUp() {
        super.setUp()
        
        sut = NameValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testValidName() {
        let result = sut.validate("Manu")
        
        XCTAssertNil(result)
    }
    
    func testInvalidNameAllNumbers() {
        let result = sut.validate("123456")
        
        XCTAssertEqual(result, .invalidText)
    }
    
    func testInvalidNameWithEmail() {
        let result = sut.validate("manu@manu.com")
        
        XCTAssertEqual(result, .invalidText)
    }

}
