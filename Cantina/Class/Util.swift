//
//  Util.swift
//  Cantina
//
//  Created by Eduardo Rangel on 1/17/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import UIKit
import Foundation

class Util: NSObject {
    
    static func roundImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    
    
    static func hourFrom(date: NSDate) -> String {
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        calendar.timeZone = NSTimeZone(name: "America/Sao_Paulo")!
        
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        let hour = components.hour
        let minute = components.minute
        
        return String(format: "%d:%.2dh", hour, minute)
    }
    
    
    static func dayFrom(date: NSDate) -> String {
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        
        let components = calendar.components([.Day, .Month], fromDate: date)
        let day = components.day
        
        let months = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
        let month = months[components.month - 1]
        
        return String(format: "%d %@", day, month)
    }
    
    
    
}