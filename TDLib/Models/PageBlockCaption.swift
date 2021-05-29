//
//  PageBlockCaption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a caption of an instant view web page block, consisting of a text and a trailing credit
internal struct PageBlockCaption: Codable {
    /// Block credit (like HTML tag <cite>)
    internal let credit: RichText

    /// Content of the caption
    internal let text: RichText

    internal init(
        credit: RichText,
        text: RichText
    ) {
        self.credit = credit
        self.text = text
    }
}
