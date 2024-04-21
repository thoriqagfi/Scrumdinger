//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Agfi on 09/04/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack {
            List($scrums, id: \.title) {
                $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum), label: {
                    CardView(scrum: scrum)
                })
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar(content: {
                Button(action: {
                    isPresentingNewScrumView = true
                }, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New scrum")
            })
        }
        .sheet(isPresented: $isPresentingNewScrumView, content: {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        })
        .onChange(of: scenePhase) {
            phase in
            if phase == .inactive { saveAction() }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
