//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Agfi on 15/04/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form(content: {
            Section("Meeting Info", content: {
                TextField("Title", text: $scrum.title)
                HStack(content: {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthMinutes) minutes")
                        .accessibilityHidden(true)
                })
                ThemePicker(selection: $scrum.theme)
            })
            
            Section("Attendees", content: {
                ForEach(scrum.attendees, content: {
                    attendee in
                    Text(attendee.name)
                })
                .onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
            })
            HStack {
                TextField("New Attendee", text: $newAttendeeName)
                Button(action: {
                    withAnimation{
                        let attendee = DailyScrum.Attendee(name: newAttendeeName)
                        scrum.attendees.append(attendee)
                        newAttendeeName = ""
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .accessibilityLabel("Add Attendee")
                })
                .disabled(newAttendeeName.isEmpty)
            }
        })
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
