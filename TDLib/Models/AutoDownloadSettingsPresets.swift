//
//  AutoDownloadSettingsPresets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains auto-download settings presets for the user
internal struct AutoDownloadSettingsPresets: Codable {
    /// Preset with highest settings; supposed to be used by default when connected on Wi-Fi
    internal let high: AutoDownloadSettings

    /// Preset with lowest settings; supposed to be used by default when roaming
    internal let low: AutoDownloadSettings

    /// Preset with medium settings; supposed to be used by default when using mobile data
    internal let medium: AutoDownloadSettings

    internal init(
        high: AutoDownloadSettings,
        low: AutoDownloadSettings,
        medium: AutoDownloadSettings
    ) {
        self.high = high
        self.low = low
        self.medium = medium
    }
}
