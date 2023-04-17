//
//  Journal.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import Foundation
import SwiftUI

struct TolThought: Identifiable, Codable {
    let id: UUID
    var title: String?
    var date: Date
    var lengthSeconds: Int?
    var lengthWords: Int?
    var transcript: String?
    init(id: UUID = UUID(), title: String? = nil, date: Date = Date(), lengthSeconds: Int? = nil, lengthWords: Int? = nil, transcript: String? = nil)
        {
            self.id = id
            self.title = title
            self.date = date
            self.lengthSeconds = lengthSeconds
            self.lengthWords = lengthWords
            self.transcript = transcript
    }
}

extension TolThought {
    static let sampleData: [TolThought] =
    [
        
        TolThought(id: UUID(), title: "I went to Purdue today", date: DateFormatter().date(from: "2023-03-19 10:12:00")!, lengthSeconds: 159, lengthWords: 391, transcript: "Today, I flew to Purdue to visit my best friend Jordan..."),
        TolThought(id: UUID(), title: "Thoughts on Purdue's campus", date: DateFormatter().date(from: "2023-03-19 12:56:00")!, lengthSeconds: 159, lengthWords: 391, transcript: "Today, I flew to Purdue to visit my best friend Jordan..."),
        TolThought(id: UUID(), title: "I went to Purdue today", date: DateFormatter().date(from: "2023-03-19 17:37:00")!, lengthSeconds: 159, lengthWords: 391, transcript: "Today, I flew to Purdue to visit my best friend Jordan...")
    
    ]
}
