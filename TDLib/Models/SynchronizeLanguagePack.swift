//
//  SynchronizeLanguagePack.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method shouldn't be called explicitly for the current used/base language packs. Can be called before authorization
internal struct SynchronizeLanguagePack: Codable {
    /// Language pack identifier
    internal let languagePackId: String

    internal init(languagePackId: String) {
        self.languagePackId = languagePackId
    }
}
