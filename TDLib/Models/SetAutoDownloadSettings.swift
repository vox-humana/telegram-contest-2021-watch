//
//  SetAutoDownloadSettings.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets auto-download settings
internal struct SetAutoDownloadSettings: Codable {
    /// New user auto-download settings
    internal let settings: AutoDownloadSettings

    /// Type of the network for which the new settings are applied
    internal let type: NetworkType

    internal init(
        settings: AutoDownloadSettings,
        type: NetworkType
    ) {
        self.settings = settings
        self.type = type
    }
}
