//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Agfi on 09/04/24.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List(scrums, id: \.title) {
                scrum in
                NavigationLink(destination: DetailView(scrum: scrum), label: {
                    CardView(scrum: scrum)
                })
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar(content: {
                Button(action: {}, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New scrum")
            })
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
