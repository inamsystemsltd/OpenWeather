//
//  String.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

extension String{
    
    func getDayFromDateString()->String{
        let dateString = self
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: dateString) else {
            return ""
        }
        let calanderDate = Calendar.current.dateComponents([.day, .year, .month, .weekday], from: date)
        let dayName = formatter.weekdaySymbols[(calanderDate.weekday ?? 1) - 1]
        return dayName
    }
    
    func getTimeFromDateString()->String{
        let dateString = self
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: dateString) else {
            return ""
        }
        formatter.dateFormat = "hh:mm a"
        let time = formatter.string(from: date)
        return time
    }
    
    func getDateFromDateString()->String{
        let dateString = self
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: dateString) else {
            return ""
        }
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
