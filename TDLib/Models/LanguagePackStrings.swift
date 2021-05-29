//
//  LanguagePackStrings.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of language pack strings
internal struct LanguagePackStrings: Codable {
    /// A list of language pack strings
    internal let strings: [LanguagePackString]

    internal init(strings: [LanguagePackString]) {
        self.strings = strings
    }
}
