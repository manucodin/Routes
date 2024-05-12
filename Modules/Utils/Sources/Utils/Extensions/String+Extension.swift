//
//  String+Extension.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation

public extension String {
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        return date
    }
}
