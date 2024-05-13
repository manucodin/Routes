//
//  TripsClientTests.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import XCTest
import Mocker

@testable import Network

final class TripsClientTests: XCTestCase {

    private var sut: TripsAPIClient!
    private var networkClient: NetworkClient!
    
    override func setUp() {
        super.tearDown()
        
        networkClient = NetworkClientImpl(configuration: NetworkClientConfiguration.testingConfiguration)
        sut = TripsAPIClientImpl(networkClient: networkClient)
    }
    
    override func tearDown() {
        networkClient = nil
        sut = nil
        
        super.tearDown()
    }

    func testObtainTrips() async throws {
        TripsMockerMock.mockTripList()
        
        do {
            let response: [TripDTO] = try await sut.obtainTrips()
            XCTAssertFalse(response.isEmpty)
        } catch {
            XCTFail("Unexpected error")
        }
    }
    
    func testObtainTripsWithError404() async throws {
        MockerMock.mock404Error()
        
        do {
            let _: [TripDTO] = try await sut.obtainTrips()
            XCTFail("Expected error")
        } catch let error {
            if let error = error as? Network.NetworkError {
                XCTAssertTrue(error == .networkError)
            } else {
                XCTFail("Expected network error")
            }
        }
    }
    
    func testObtainTripsWithError500() async throws {
        MockerMock.mock500Error()
        
        do {
            let _: [TripDTO] = try await sut.obtainTrips()
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
