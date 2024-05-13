//
//  PhoneValidatorTests.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 13/5/24.
//

import XCTest

@testable import Utils

final class PhoneValidatorTests: XCTestCase {

    private var sut: PhoneValidator!
    
    override func setUp() {
        super.setUp()
        
        sut = PhoneValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testValidPhone() {
        let result = sut.validate("666777888")
        
        XCTAssertNil(result)
    }
    
    func testValidPhoneWithPrefix() {
        let result = sut.validate("34666777888")
        
        XCTAssertNil(result)
    }
    
    func testValidPhoneWithPrefixAndPlus() {
        let result = sut.validate("+34666777888")
        
        XCTAssertNil(result)
    }
    
    func testInvalidPhoneAllCharacters() {
        let result = sut.validate("abcdef")
        
        XCTAssertEqual(result, .invalidPhone)
    }
    
    func testInvalidPhoneAllStrangeCharacters() {
        let result = sut.validate("*&^%%")
        
        XCTAssertEqual(result, .invalidPhone)
    }

}
