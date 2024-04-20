//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Agfi on 28/03/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
//            MeetingView()
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
//            LoginView()
        }
    }
}
