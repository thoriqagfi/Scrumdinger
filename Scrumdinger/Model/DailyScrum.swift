//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Agfi on 28/03/24.
//

import Foundation

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthMinutes: Int
    var theme: Theme
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
