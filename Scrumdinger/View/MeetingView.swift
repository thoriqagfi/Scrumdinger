//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Agfi on 28/03/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack(content: {
                VStack(content: {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                })
                Spacer()
                VStack(content: {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("1500", systemImage: "hourglass.bottomhalf.fill")
                })
            })
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 Minutes")
            
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 24))
            HStack(content: {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "forward.fill")
                })
                .accessibilityLabel("Next Spekaer")
            })
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
