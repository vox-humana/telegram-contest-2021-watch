//
//  SetCustomLanguagePack.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds or changes a custom local language pack to the current localization target
internal struct SetCustomLanguagePack: Codable {
    /// Information about the language pack. Language pack ID must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
    internal let info: LanguagePackInfo

    /// Strings of the new language pack
    internal let strings: [LanguagePackString]

    internal init(
        info: LanguagePackInfo,
        strings: [LanguagePackString]
    ) {
        self.info = info
        self.strings = strings
    }
}
