//
//  DateExtensionTests.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import XCTest

final class DateExtensionTests: XCTestCase {
    
    func testToFormat() {
        let date = Date(timeIntervalSince1970: 727683998)
        
        let formattedDate = date.toFormat("yyyy-MM-dd")
        
        XCTAssertEqual(formattedDate, "1993-01-22")
    }

    func testToFormatWithTime() {
        let date = Date(timeIntervalSince1970: 727683998)
        
        let formattedDate = date.toFormat("MM/dd/yyyy, HH:mm:ss")
        
        XCTAssertEqual(formattedDate, "01/22/1993, 07:26:38")
    }
    
    func testCalculateTimeBeetweenOnlyHours() {
        let starteDate = Date(timeIntervalSince1970: 1715403600)
        let endDate = Date(timeIntervalSince1970: 1715407200)
        
        let value = Date.calculateTimeBetweenDates(starteDate: starteDate, endDate: endDate)
        
        XCTAssertEqual(value, "1h")
    }
    
    func testCalculateTimeBeetweenHoursAndMinutes() {
        let starteDate = Date(timeIntervalSince1970: 1715403600)
        let endDate = Date(timeIntervalSince1970: 1715409000)
        
        let value = Date.calculateTimeBetweenDates(starteDate: starteDate, endDate: endDate)
        
        XCTAssertEqual(value, "1h 30min")
    }
    
    func testCalculateTimeBeetweenOnlyMinutes() {
        let starteDate = Date(timeIntervalSince1970: 1715407200)
        let endDate = Date(timeIntervalSince1970: 1715409000)
        
        let value = Date.calculateTimeBetweenDates(starteDate: starteDate, endDate: endDate)
        
        XCTAssertEqual(value, "30min")
    }
    
    func testCalculateTimeBeetweenHourMinutesAndSeconds() {
        let starteDate = Date(timeIntervalSince1970: 1715403600)
        let endDate = Date(timeIntervalSince1970: 1715409010)
        
        let value = Date.calculateTimeBetweenDates(starteDate: starteDate, endDate: endDate)
        
        XCTAssertEqual(value, "1h 30min 10seg")
    }
    
    func testCalculateTimeBeetweenOnlySeconds() {
        let starteDate = Date(timeIntervalSince1970: 1715409000)
        let endDate = Date(timeIntervalSince1970: 1715409010)
        
        let value = Date.calculateTimeBetweenDates(starteDate: starteDate, endDate: endDate)
        
        XCTAssertEqual(value, "10seg")
    }
}
