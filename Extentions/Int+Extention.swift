//
//  Int+Extention.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import Foundation

extension Int {
    func toFormatedHourMinuteText() -> String {
        let hours = self / 60
        let minutes = self % 60

        let timeString = String(format: "%02dH:%02dM", hours, minutes)
        return timeString
    }
}
