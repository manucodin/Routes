//
//  EmailValidatorTests.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 13/5/24.
//

import XCTest

@testable import Utils

final class EmailValidatorTests: XCTestCase {

    private var sut: EmailValidator!
    
    override func setUp() {
        super.setUp()
        
        sut = EmailValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testValidEmail() {
        let result = sut.validate("manu@manu.com")
        
        XCTAssertNil(result)
    }
    
    func testInvalidEmailAllNumbers() {
        let result = sut.validate("123456789")
        
        XCTAssertEqual(result, .invalidEmail)
    }
    
    func testInvalidEmailAllCharacters() {
        let result = sut.validate("abcdefg")
        
        XCTAssertEqual(result, .invalidEmail)
    }
    
    func testInvalidEmailWithoutDomain() {
        let result = sut.validate("manu.com")
        
        XCTAssertEqual(result, .invalidEmail)
    }
    
    func testInvalidEmailWithoutExtension() {
        let result = sut.validate("manu@manu")
        
        XCTAssertEqual(result, .invalidEmail)
    }

}
