//
//  GetLanguagePackString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously
internal struct GetLanguagePackString: Codable {
    /// Language pack key of the string to be returned
    internal let key: String

    /// Path to the language pack database in which strings are stored
    internal let languagePackDatabasePath: String

    /// Language pack identifier
    internal let languagePackId: String

    /// Localization target to which the language pack belongs
    internal let localizationTarget: String

    internal init(
        key: String,
        languagePackDatabasePath: String,
        languagePackId: String,
        localizationTarget: String
    ) {
        self.key = key
        self.languagePackDatabasePath = languagePackDatabasePath
        self.languagePackId = languagePackId
        self.localizationTarget = localizationTarget
    }
}
