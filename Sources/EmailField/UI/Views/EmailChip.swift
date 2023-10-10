//
//  EmailChip.swift
//
//
//  Created by Kévin Sibué on 10/10/2023.
//

import SwiftUI

struct EmailChip: View {
    let email: Email
    let onDelete: (Email) -> Void

    var body: some View {
        HStack {
            Text(email.value)
                .foregroundColor(Color.white)
                .font(.headline)
                .fontWeight(.bold)
            Button {
                onDelete(email)
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color.white)
                    .frame(width: 16, height: 16)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16.0)
        .padding(.vertical, 8.0)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.accentColor)
        )
    }
}
