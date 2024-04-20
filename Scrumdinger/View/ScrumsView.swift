//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Agfi on 09/04/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
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
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
