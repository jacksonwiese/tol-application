//
//  Journal.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import Foundation

struct TolThought: Identifiable, Codable {
    let id: UUID
    var title: String
    var date: Date
    var lengthSeconds: Int
    var lengthWords: Int
    var transcript: String
}

extension TolThought {
    static let sampleData: [TolThought] =
    [
        TolThought(id: UUID(), title: "I went to Purdue today", date: DateFormatter().date(from: "2023-03-19 10:12:00")!, lengthSeconds: 159, lengthWords: 391, transcript: "Today, I flew to Purdue to visit my best friend Jordan..."),
        TolThought(id: UUID(), title: "Thoughts on Purdue's campus", date: DateFormatter().date(from: "2023-03-19 12:56:00")!, lengthSeconds: 159, lengthWords: 391, transcript: "Today, I flew to Purdue to visit my best friend Jordan..."),
        TolThought(id: UUID(), title: "I went to Purdue today", date: DateFormatter().date(from: "2023-03-19 17:37:00")!, lengthSeconds: 159, lengthWords: 391, transcript: "Today, I flew to Purdue to visit my best friend Jordan...")
        
//        DailyScrum(title: "Design",
//                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
//                   lengthInMinutes: 10,
//                   theme: .yellow),
//        DailyScrum(title: "App Dev",
//                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
//                   lengthInMinutes: 5,
//                   theme: .orange),
//        DailyScrum(title: "Web Dev",
//                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
//                   lengthInMinutes: 5,
//                   theme: .poppy)
    ]
}
