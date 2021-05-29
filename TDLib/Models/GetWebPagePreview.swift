//
//  GetWebPagePreview.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview
internal struct GetWebPagePreview: Codable {
    /// Message text with formatting
    internal let text: FormattedText

    internal init(text: FormattedText) {
        self.text = text
    }
}
