//
//  DateValue.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/17/23.
//

import SwiftUI

//Date Value Model mmm
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
