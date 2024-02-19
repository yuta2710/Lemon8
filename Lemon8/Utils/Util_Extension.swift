//
//  Extension.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 12/02/2024.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch {
            return [:]
        }
    }
}

extension Date {
    func timeAgoFromNow() -> String {
        let yearComponents = Calendar.current.dateComponents([.year], from: self, to: Date())

        if let year = yearComponents.year, year > 0 {
            return "\(year) year ago"
        }
        let monthsComponents = Calendar.current.dateComponents([.month], from: self, to: Date())
        if let months = monthsComponents.month, months > 0 {
            return "\(months) month ago"
        }
        let weekComponents = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date())
        if let weeks = weekComponents.weekOfYear, weeks > 0 {
            return "\(weeks) week ago"
        }
        let dayComponents = Calendar.current.dateComponents([.day], from: self, to: Date())
        if let days = dayComponents.day, days > 0 {
            return "\(days) day ago"
        }
        let hoursComponents = Calendar.current.dateComponents([.hour], from: self, to: Date())
        if let hours = hoursComponents.hour, hours > 0 {
            return "\(hours) hours ago"
        }
        let minutesComponents = Calendar.current.dateComponents([.minute], from: self, to: Date())
        if let minutes = minutesComponents.minute, minutes > 0 {
            return "\(minutes) minutes ago"
        }
        return "just now ago"
    }
}
