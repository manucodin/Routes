//
//  TripsMockerMock.swift
//  
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import Mocker

class TripsMockerMock {

    private static let urlString = "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/trips.json"

    public static func mockTripList() {
        guard let url = URL(string: urlString) else { return }
                
        let mock = Mock(url: url, ignoreQuery: true, contentType: Mock.DataType.json, statusCode: 200, data: [
            .get: TripsMockedData.tripListJSON()
        ])
        
        Mocker.register(mock)
    }
}
