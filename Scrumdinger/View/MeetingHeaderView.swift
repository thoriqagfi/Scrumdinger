//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Agfi on 18/04/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondElapsed + secondRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondElapsed) / Double(secondRemaining)
    }
    
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(.automatic)
            HStack(content: {
                VStack(content: {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)", systemImage: "hourglass.tophalf.fill")
                })
                Spacer()
                VStack(content: {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(secondRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                })
            })
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("\(minutesRemaining) Minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(secondElapsed: 60, secondRemaining: 100, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}
