//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Agfi on 19/04/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar(content: {
                    ToolbarItem(placement: .cancellationAction, content: {
                        Button(action: {
                            isPresentingNewScrumView = false
                        }, label: {
                            Text("Dismiss")
                        })
                    })
                    ToolbarItem(placement: .confirmationAction, content: {
                        Button(action: {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }, label: {
                            Text("Add")
                        })
                    })
                })
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData) ,isPresentingNewScrumView: .constant(true))
}
