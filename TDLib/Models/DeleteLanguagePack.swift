//
//  DeleteLanguagePack.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted. Can be called before authorization
internal struct DeleteLanguagePack: Codable {
    /// Identifier of the language pack to delete
    internal let languagePackId: String

    internal init(languagePackId: String) {
        self.languagePackId = languagePackId
    }
}
