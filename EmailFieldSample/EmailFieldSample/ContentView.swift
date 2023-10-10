//
//  ContentView.swift
//  EmailFieldSample
//
//  Created by Kévin Sibué on 10/10/2023.
//

import SwiftUI
import EmailField

struct ContentView: View {
    @State
    private var to: [Email] = []

    @State
    private var cc: [Email] = []

    @State
    private var bcc: [Email] = []

    var body: some View {
        VStack {
            EmailField(emails: $to, placeholder: "To")
            EmailField(emails: $cc, placeholder: "Cc")
            EmailField(emails: $bcc, placeholder: "Bcc")
            Spacer()
            Button {
                //  Nothing to do here
            } label: {
                Text("Send")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
