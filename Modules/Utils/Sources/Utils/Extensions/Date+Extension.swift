//
//  Date+Extension.swift
//
//
//  Created by Manuel Rodriguez Sebastian on 11/5/24.
//

import Foundation

public extension Date {
    func toFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    static func calculateTimeBetweenDates(starteDate: Date, endDate: Date) -> String? {
        let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: starteDate, to: endDate)
        
        var timeTravel = ""
        
        if let hours = difference.hour, hours > 0 {
            timeTravel += String(localized: "\(hours)h")
        }
        
        if let minutes = difference.minute, minutes > 0 {
            if !timeTravel.isEmpty {
                timeTravel += String(localized: " \(minutes)min")
            } else {
                timeTravel += String(localized: "\(minutes)min")
            }
        }
        
        if let seconds = difference.second, seconds > 0 {
            if !timeTravel.isEmpty {
                timeTravel += String(localized: " \(seconds)seg")
            } else {
                timeTravel += String(localized: "\(seconds)seg")
            }
        }
        
        if timeTravel.isEmpty {
            return nil
        }
        
        return timeTravel
    }
}
