//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Agfi on 28/03/24.
//

import Foundation

struct DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthMinutes)
        }
        set {
            lengthMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{ Attendee(name: $0)}
        self.lengthMinutes = lengthMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthMinutes: 10,
            theme: .yellow
        ),
        DailyScrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Una", "Luis", "Darla"],
            lengthMinutes: 5,
            theme: .orange
        ),
        DailyScrum(
            title: "App Dev",
            attendees: ["Chella", "Chris", "Christians", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah",],
            lengthMinutes: 5,
            theme: .poppy)
    ]
}
