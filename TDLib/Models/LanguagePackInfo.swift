//
//  LanguagePackInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a language pack
internal struct LanguagePackInfo: Codable {
    /// Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it should be fetched from base language pack. Unsupported in custom language packs
    internal let baseLanguagePackId: String

    /// Unique language pack identifier
    internal let id: String

    /// True, if the language pack is a beta language pack
    internal let isBeta: Bool

    /// True, if the language pack is installed by the current user
    internal let isInstalled: Bool

    /// True, if the language pack is official
    internal let isOfficial: Bool

    /// True, if the language pack strings are RTL
    internal let isRtl: Bool

    /// Total number of non-deleted strings from the language pack available locally
    internal let localStringCount: Int

    /// Language name
    internal let name: String

    /// Name of the language in that language
    internal let nativeName: String

    /// A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
    internal let pluralCode: String

    /// Total number of non-deleted strings from the language pack
    internal let totalStringCount: Int

    /// Total number of translated strings from the language pack
    internal let translatedStringCount: Int

    /// Link to language translation interface; empty for custom local language packs
    internal let translationUrl: String

    internal init(
        baseLanguagePackId: String,
        id: String,
        isBeta: Bool,
        isInstalled: Bool,
        isOfficial: Bool,
        isRtl: Bool,
        localStringCount: Int,
        name: String,
        nativeName: String,
        pluralCode: String,
        totalStringCount: Int,
        translatedStringCount: Int,
        translationUrl: String
    ) {
        self.baseLanguagePackId = baseLanguagePackId
        self.id = id
        self.isBeta = isBeta
        self.isInstalled = isInstalled
        self.isOfficial = isOfficial
        self.isRtl = isRtl
        self.localStringCount = localStringCount
        self.name = name
        self.nativeName = nativeName
        self.pluralCode = pluralCode
        self.totalStringCount = totalStringCount
        self.translatedStringCount = translatedStringCount
        self.translationUrl = translationUrl
    }
}
