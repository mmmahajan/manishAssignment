//
//  String+Extension.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 10/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation

extension String {
    
    func getTime(to end: Date = Date()) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your New Date format as per requirement change it own
        
        if let newDate = dateFormatter.date(from: self.UTCToLocal(self)) {
            if let interval = Calendar.current.dateComponents([Calendar.Component.year], from: newDate, to: end).day {
                if interval > 0 {
                    return "\(interval) year\(interval == 1 ? "":"s") "
                }
            }
            
            if let interval = Calendar.current.dateComponents([Calendar.Component.month], from: newDate, to: end).month {
                if interval > 0 {
                    return "\(interval) month\(interval == 1 ? "":"s") "
                }
            }
            
            if let interval = Calendar.current.dateComponents([Calendar.Component.weekOfMonth], from: newDate, to: end).weekOfMonth {
                if interval > 0 {
                    return "\(interval) week\(interval == 1 ? "":"s")"
                }
            }
            
            if let interval = Calendar.current.dateComponents([Calendar.Component.day], from: newDate, to: end).day {
                if interval > 0 {
                    return "\(interval) day\(interval == 1 ? "":"s")"
                }
            }
            
            if let interval = Calendar.current.dateComponents([Calendar.Component.hour], from: newDate, to: end).hour {
                if interval > 0 {
                    return "\(interval) hour\(interval == 1 ? "":"s")"
                }
            }
            
            if let interval = Calendar.current.dateComponents([Calendar.Component.minute], from: newDate, to: end).minute {
                if interval > 0 {
                    return "\(interval) minute\(interval == 1 ? "":"s")"
                }
            }
            
            return "Just now"
        }
        return ""
    }
    
    
    private func UTCToLocal(_ date:String) -> String {
        guard date != "" else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: dt!)
    }
}
