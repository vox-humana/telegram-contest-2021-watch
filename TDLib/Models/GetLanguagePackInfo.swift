//
//  GetLanguagePackInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization
internal struct GetLanguagePackInfo: Codable {
    /// Language pack identifier
    internal let languagePackId: String

    internal init(languagePackId: String) {
        self.languagePackId = languagePackId
    }
}
