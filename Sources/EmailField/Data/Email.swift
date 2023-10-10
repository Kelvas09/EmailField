//
//  Email.swift
//
//
//  Created by Kévin Sibué on 10/10/2023.
//

import Foundation

/// Represent an email
public struct Email: Identifiable, Hashable {
    enum EmailError: Error {
        case invalid
    }
    
    /// Unique identifier of current email
    public let id: String
    /// Current email value
    public let value: String
    
    /// Create a new email address.
    /// This init can throw an exception if value isn't a valid email.
    /// - Parameter value: Email string value
    public init(_ value: String) throws {
        guard Self.isValidEmailAddress(emailAddressString: value) else {
            throw EmailError.invalid
        }
        self.id = UUID().uuidString
        self.value = value
    }

    private static func isValidEmailAddress(emailAddressString: String) -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0
            {
                returnValue = false
            }

        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }

        return returnValue
    }
}
