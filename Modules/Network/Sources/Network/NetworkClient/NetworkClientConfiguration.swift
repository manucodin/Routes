//
//  NetworkClientConfiguration.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 10/5/24.
//

import Foundation
import Alamofire
import Mocker

struct NetworkClientConfiguration {
    static var defaultConfiguration: URLSessionConfiguration {
        return URLSessionConfiguration.af.default
    }
    
    static var testingConfiguration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        
        return configuration
    }
}
