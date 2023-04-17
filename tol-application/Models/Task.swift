//
//  Task.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/17/23.
//

import SwiftUI

//Task Model and sample task
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Task Meta data view....
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

//sample date for testing
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Talk to Jordan"),
        Task(title: "Call your mom"),
        Task(title: "Get homework done today")
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        Task(title: "Talk with Jenna Pirazzi")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        Task(title: "Get pizza for dinner")
    ], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaData(task: [
        Task(title: "Next version of SwiftUI")
    ], taskDate: getSampleDate(offset: 10)),
    
    TaskMetaData(task: [
        Task(title: "Get a workout in")
    ], taskDate: getSampleDate(offset: -22)),
    
    TaskMetaData(task: [
        Task(title: "Go by the mall for new clothes")
    ], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        Task(title: "Tol app updates")
    ], taskDate: getSampleDate(offset: -20))
]
