//
//  Extensions.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var timeInterval: TimeInterval? {
        let parts = self.split(separator: ":")
        guard parts.count == 3,
              let hours = Double(parts[0]),
              let minutes = Double(parts[1]),
              let seconds = Double(parts[2])
        else { return nil }
        return hours * 3600 + minutes * 60 + seconds
    }
    
    func deducted(by seconds: TimeInterval = 1) -> String {
        guard let interval = self.timeInterval else { return "invalid_time_elapsed".localized }
        let newInterval = interval - seconds
        return newInterval.display()
    }
}

extension TimeInterval {
    func display() -> String {
        guard self >= 0 else { return "invalid_time_elapsed".localized }
        let hours = Int(self) / 3600
        let minutes = (Int(self) % 3600) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
