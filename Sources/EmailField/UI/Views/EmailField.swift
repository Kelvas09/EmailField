//
//  EmailField.swift
//
//
//  Created by Kévin Sibué on 10/10/2023.
//

import SwiftUI


/// Fields for entering email addresses in the shape of deletable chips
public struct EmailField: View {

    @Binding
    /// All email addresses created by this field
    public var emails: [Email]
    
    /// Placeholder to use on embedded `TextField`
    public let placeholder: String

    @State
    private var input = ""

    @State
    private var attempts: Int = 0

    /// Create a new EmailField
    /// - Parameters:
    ///   - emails: Binding to all emails to display or store
    ///   - placeholder: Default placeholder ot use on embedded `TextField`
    public init(emails: Binding<[Email]>, placeholder: String) {
        self._emails = emails
        self.placeholder = placeholder
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(emails, id: \.self) { email in
                    EmailChip(email: email) { email in
                        emails.removeAll(where: { $0 == email })
                    }
                }
                TextField(placeholder, text: $input)
                    .onSubmit(of: .text) {
                        withAnimation(.default) {
                            do {
                                let email = try Email(input)
                                emails.append(email)
                                input = ""
                            } catch {
                                attempts += 1
                            }
                        }
                    }
            }
        }
        .modifier(ShakeEffect(animatableData: CGFloat(attempts)))
    }
}
