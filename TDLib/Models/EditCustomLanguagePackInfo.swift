//
//  EditCustomLanguagePackInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits information about a custom local language pack in the current localization target. Can be called before authorization
internal struct EditCustomLanguagePackInfo: Codable {
    /// New information about the custom local language pack
    internal let info: LanguagePackInfo

    internal init(info: LanguagePackInfo) {
        self.info = info
    }
}
