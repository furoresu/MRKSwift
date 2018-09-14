//
//  Date+Format.swift
//  MRKSwift
//
//  Created by MRKTrace on 14/9/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

public enum MRKDateFormat : String {
    case hour = "HH:mm"
    case date = "yyyy-MM-dd"
    case half = "yyyy-MM-dd HH:mm"
    case full = "yyyy-MM-dd HH:mm:ss"
}

public func str2Date(_ dateString : String, _ format : MRKDateFormat = .date) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = format.rawValue
    return formatter.date(from: dateString)
}

extension Date {
    public func toString( _ format: MRKDateFormat = .date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
    
    public func toString(withStyle style : DateFormatter.Style)->String{
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
}
