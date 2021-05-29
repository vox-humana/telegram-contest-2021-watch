//
//  UserPrivacySettingRules.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed
internal struct UserPrivacySettingRules: Codable {
    /// A list of rules
    internal let rules: [UserPrivacySettingRule]

    internal init(rules: [UserPrivacySettingRule]) {
        self.rules = rules
    }
}
