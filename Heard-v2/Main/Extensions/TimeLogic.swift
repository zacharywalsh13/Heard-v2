//
//  TestTimer.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 4/9/22.
//

import SwiftUI


extension Date {
    var month: Int {
       let cal = Calendar.current
       return cal.dateComponents([.month], from: self).month ?? 0
    }
    var day: Int {
       let cal = Calendar.current
       return cal.dateComponents([.day], from: self).day ?? 0
    }
    var year: Int {
       let cal = Calendar.current
       return cal.dateComponents([.year], from: self).year ?? 0
    }
    var second: Int {
       let cal = Calendar.current
       return cal.dateComponents([.second], from: self).second ?? 0
    }
    var minute: Int {
       let cal = Calendar.current
       return cal.dateComponents([.minute], from: self).minute ?? 0
    }
    var hour: Int {
       let cal = Calendar.current
       return cal.dateComponents([.hour], from: self).hour ?? 0
    }
}
