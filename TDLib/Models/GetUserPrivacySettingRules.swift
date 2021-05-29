//
//  GetUserPrivacySettingRules.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the current privacy settings
internal struct GetUserPrivacySettingRules: Codable {
    /// The privacy setting
    internal let setting: UserPrivacySetting

    internal init(setting: UserPrivacySetting) {
        self.setting = setting
    }
}
