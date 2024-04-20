//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Agfi on 10/04/24.
//

import SwiftUI
import AuthenticationServices

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List(content: {
            Section("Meeting info", content: {
                NavigationLink(destination: MeetingView(scrum: $scrum), label: {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                })
                
                HStack(content: {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthMinutes) minutes")
                })
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
            })
            
            Section("Attendees", content: {
                ForEach(scrum.attendees, content: {
                    attendee in
                    Label(attendee.name, systemImage: "person")
                })
            })
            
            Section("History", content: {
                if scrum.history.isEmpty {
                    Label(
                        title: { Text("No Meetings Yet") },
                        icon: { Image(systemName: "calendar.badge.exclamationmark") }
                    )
                }
                ForEach(scrum.history) { history in
                    HStack(content: {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    })
                }
            })
        })
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction, content: {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        })
                        ToolbarItem(placement: .confirmationAction, content: {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        })
                    }
            }
        })
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
