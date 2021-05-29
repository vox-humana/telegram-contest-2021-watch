//
//  LocalizationTargetInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the current localization target
internal struct LocalizationTargetInfo: Codable {
    /// List of available language packs for this application
    internal let languagePacks: [LanguagePackInfo]

    internal init(languagePacks: [LanguagePackInfo]) {
        self.languagePacks = languagePacks
    }
}
