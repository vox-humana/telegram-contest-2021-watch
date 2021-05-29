//
//  DeepLinkInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a tg:// deep link
internal struct DeepLinkInfo: Codable {
    /// True, if user should be asked to update the application
    internal let needUpdateApplication: Bool

    /// Text to be shown to the user
    internal let text: FormattedText

    internal init(
        needUpdateApplication: Bool,
        text: FormattedText
    ) {
        self.needUpdateApplication = needUpdateApplication
        self.text = text
    }
}
