//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Agfi on 22/04/24.
//

import SwiftUI

struct MeetingTimerView: View {
    let speaker: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speaker.first(where: {
            !$0.isCompleted
        })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is Speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) {
                    speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: {$0.id == speaker.id}) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90.0))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
}

var speakers: [ScrumTimer.Speaker] {
    [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
}

#Preview {
    MeetingTimerView(speaker: speakers, theme: .yellow)
}
