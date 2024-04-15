//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Agfi on 10/04/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List(content: {
            Section("Meeting info", content: {
                NavigationLink(destination: MeetingView(), label: {
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
