//
//  NetworkClientTests.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import XCTest

@testable import Network

final class NetworkClientTests: XCTestCase {
    
    private var sut: NetworkClient!
    
    override func setUp() {
        super.setUp()
        
        sut = NetworkClientImpl(configuration: NetworkClientConfiguration.testingConfiguration)
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testMakeRequestWithResponse() async throws {
        MockerMock.mockTripList()
        
        do {
            let response: [TripDTO]? = try await sut.get(service: TripsAPIService.trips)
            XCTAssertNotNil(response, "Expected a response")
        } catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testMakeRequestWithNetworkError() async throws {
        MockerMock.mock404Error()
        
        do {
            let _: [TripDTO]? = try await sut.get(service: TripsAPIService.trips)
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? Network.NetworkError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }
    
    func testMakeRequestWithError500() async throws {
        MockerMock.mock500Error()
        
        do {
            let _: [TripDTO]? = try await sut.get(service: TripsAPIService.trips)
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? Network.NetworkError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }    
}
