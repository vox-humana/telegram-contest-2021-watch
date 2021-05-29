//
//  HideSuggestedAction.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Hides a suggested action
internal struct HideSuggestedAction: Codable {
    /// Suggested action to hide
    internal let action: SuggestedAction

    internal init(action: SuggestedAction) {
        self.action = action
    }
}
