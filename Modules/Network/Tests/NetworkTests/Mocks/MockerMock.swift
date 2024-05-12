//
//  MockerMock.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation
import Mocker
import Alamofire

class MockerMock {
    
    private static let urlString = "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/trips.json"
    
    public static func mock404Error() {
        guard let url = URL(string: urlString) else { return }
        
        let mock = Mock(url: url, contentType: Mock.DataType.json, statusCode: 404, data: [
            .get: Data()
        ], requestError: AFError.invalidURL(url: url))
        
        Mocker.register(mock)
    }
    
    public static func mock500Error() {
        guard let url = URL(string: urlString) else { return }
        
        let mock = Mock(url: url, contentType: Mock.DataType.json, statusCode: 500, data: [
            .get: Data()
        ], requestError: AFError.serverTrustEvaluationFailed(reason: .noPublicKeysFound))
        
        Mocker.register(mock)
    }
}
