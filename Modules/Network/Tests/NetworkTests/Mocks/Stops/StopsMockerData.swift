//
//  StopsMockerData.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation

class StopsMockerData {
    public static func tripListJSON() -> Data {
        return MockedData.readDataFromFile(fileName: "stopInfo")!
    }
}
