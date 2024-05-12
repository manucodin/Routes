//
//  ApplicationBadgeServiceImpl.swift
//  Routes
//
//  Created by Manuel Rodriguez Sebastian on 12/5/24.
//

import Foundation
import UIKit

class ApplicationBadgeServiceImpl: ApplicationBadgeService {
    
    func setApplicationBadge(_ value: Int) {
        UNUserNotificationCenter.current().setBadgeCount(value)
    }
    
    func resetApplictionBadge() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }

}
