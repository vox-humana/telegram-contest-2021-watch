//
//  SetCustomLanguagePackString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds, edits or deletes a string in a custom local language pack. Can be called before authorization
internal struct SetCustomLanguagePackString: Codable {
    /// Identifier of a previously added custom local language pack in the current localization target
    internal let languagePackId: String

    /// New language pack string
    internal let newString: LanguagePackString

    internal init(
        languagePackId: String,
        newString: LanguagePackString
    ) {
        self.languagePackId = languagePackId
        self.newString = newString
    }
}
