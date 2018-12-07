//
//  Date+Day.swift
//  MRKSwift
//
//  Created by MRKTrace on 14/9/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

public extension Date {
    public func isToday() -> Bool{
        return Calendar.current.isDateInToday(self)
    }
    
    public func isTomorrow() -> Bool{
        return Calendar.current.isDateInTomorrow(self)
    }
    
    public func isYesterday() -> Bool{
        return Calendar.current.isDateInYesterday(self)
    }
}
