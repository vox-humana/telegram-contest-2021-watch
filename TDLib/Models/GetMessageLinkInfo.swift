//
//  GetMessageLinkInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a public or private message link
internal struct GetMessageLinkInfo: Codable {
    /// The message link in the format "https://t.me/c/...", or "tg://privatepost?...", or "https://t.me/username/...", or "tg://resolve?..."
    internal let url: String

    internal init(url: String) {
        self.url = url
    }
}
