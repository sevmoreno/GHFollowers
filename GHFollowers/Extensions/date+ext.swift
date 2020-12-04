//
//  date+ext.swift
//  GHFollowers
//
//  Created by Juan Moreno on 9/8/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import Foundation



// String -> Date -> String



extension Date {
    
    
    func convertToMonthYearFormat () -> String {
        
        
        let dateFormater = DateFormatter ()
        
        dateFormater.dateFormat = "MMM yyyy"
        
        return dateFormater.string(from: self)
        
        
        
    }
    
    
}


extension String {
    
    
    // https://nsdateformatter.com/
    
    func convertToDate() -> Date? {
        
        
        let dateFormatter = DateFormatter ()
        
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
        
    }
    
    
    func convertToDisplayFormat() -> String {
        
        guard let date = self.convertToDate() else { return "N/A"}
        
        return date.convertToMonthYearFormat()
    }
    
}
