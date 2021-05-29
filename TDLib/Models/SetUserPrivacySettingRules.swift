//
//  SetUserPrivacySettingRules.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes user privacy settings
internal struct SetUserPrivacySettingRules: Codable {
    /// The new privacy rules
    internal let rules: UserPrivacySettingRules

    /// The privacy setting
    internal let setting: UserPrivacySetting

    internal init(
        rules: UserPrivacySettingRules,
        setting: UserPrivacySetting
    ) {
        self.rules = rules
        self.setting = setting
    }
}
