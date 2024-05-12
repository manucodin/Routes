//
//  MockedData.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation

public final class TripsMockedData {
    public static func tripListJSON() -> Data {
        return MockedData.readDataFromFile(fileName: "trip_list")!
    }
}
