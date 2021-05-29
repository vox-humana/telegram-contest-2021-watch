//
//  GetLocalizationTargetInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization
internal struct GetLocalizationTargetInfo: Codable {
    /// If true, returns only locally available information without sending network requests
    internal let onlyLocal: Bool

    internal init(onlyLocal: Bool) {
        self.onlyLocal = onlyLocal
    }
}
