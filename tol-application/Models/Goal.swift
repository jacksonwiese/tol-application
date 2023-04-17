//
//  Task.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/17/23.
//

import SwiftUI

//Task Model and sample task
struct Goal: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Task Meta data view....
struct GoalMetaData: Identifiable {
    var id = UUID().uuidString
    var goal: [Goal]
    var goalDate: Date
}

//sample date for testing
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


var goals: [GoalMetaData] = [
    GoalMetaData(goal: [
        Goal(title: "Talk to Jordan"),
        Goal(title: "Call your mom"),
        Goal(title: "Get homework done today")
    ], goalDate: getSampleDate(offset: 1)),
    
    GoalMetaData(goal: [
        Goal(title: "Talk with Jenna Pirazzi")
    ], goalDate: getSampleDate(offset: -3)),
    
    GoalMetaData(goal: [
        Goal(title: "Get pizza for dinner")
    ], goalDate: getSampleDate(offset: -8)),
    
    GoalMetaData(goal: [
        Goal(title: "Next version of SwiftUI")
    ], goalDate: getSampleDate(offset: 10)),
    
    GoalMetaData(goal: [
        Goal(title: "Get a workout in")
    ], goalDate: getSampleDate(offset: -22)),
    
    GoalMetaData(goal: [
        Goal(title: "Go by the mall for new clothes")
    ], goalDate: getSampleDate(offset: 15)),
    
    GoalMetaData(goal: [
        Goal(title: "Tol app updates")
    ], goalDate: getSampleDate(offset: -20))
]
