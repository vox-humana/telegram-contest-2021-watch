//
//  RichText.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a text object inside an instant-view web page
internal indirect enum RichText: Codable {
    /// A plain text
    case richTextPlain(RichTextPlain)

    /// A bold rich text
    case richTextBold(RichTextBold)

    /// An italicized rich text
    case richTextItalic(RichTextItalic)

    /// An underlined rich text
    case richTextUnderline(RichTextUnderline)

    /// A strikethrough rich text
    case richTextStrikethrough(RichTextStrikethrough)

    /// A fixed-width rich text
    case richTextFixed(RichTextFixed)

    /// A rich text URL link
    case richTextUrl(RichTextUrl)

    /// A rich text email link
    case richTextEmailAddress(RichTextEmailAddress)

    /// A subscript rich text
    case richTextSubscript(RichTextSubscript)

    /// A superscript rich text
    case richTextSuperscript(RichTextSuperscript)

    /// A marked rich text
    case richTextMarked(RichTextMarked)

    /// A rich text phone number
    case richTextPhoneNumber(RichTextPhoneNumber)

    /// A small image inside the text
    case richTextIcon(RichTextIcon)

    /// A reference to a richTexts object on the same web page
    case richTextReference(RichTextReference)

    /// An anchor
    case richTextAnchor(RichTextAnchor)

    /// A link to an anchor on the same web page
    case richTextAnchorLink(RichTextAnchorLink)

    /// A concatenation of rich texts
    case richTexts(RichTexts)

    private enum Kind: String, Codable {
        case richTextPlain
        case richTextBold
        case richTextItalic
        case richTextUnderline
        case richTextStrikethrough
        case richTextFixed
        case richTextUrl
        case richTextEmailAddress
        case richTextSubscript
        case richTextSuperscript
        case richTextMarked
        case richTextPhoneNumber
        case richTextIcon
        case richTextReference
        case richTextAnchor
        case richTextAnchorLink
        case richTexts
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .richTextPlain:
            let value = try RichTextPlain(from: decoder)
            self = .richTextPlain(value)
        case .richTextBold:
            let value = try RichTextBold(from: decoder)
            self = .richTextBold(value)
        case .richTextItalic:
            let value = try RichTextItalic(from: decoder)
            self = .richTextItalic(value)
        case .richTextUnderline:
            let value = try RichTextUnderline(from: decoder)
            self = .richTextUnderline(value)
        case .richTextStrikethrough:
            let value = try RichTextStrikethrough(from: decoder)
            self = .richTextStrikethrough(value)
        case .richTextFixed:
            let value = try RichTextFixed(from: decoder)
            self = .richTextFixed(value)
        case .richTextUrl:
            let value = try RichTextUrl(from: decoder)
            self = .richTextUrl(value)
        case .richTextEmailAddress:
            let value = try RichTextEmailAddress(from: decoder)
            self = .richTextEmailAddress(value)
        case .richTextSubscript:
            let value = try RichTextSubscript(from: decoder)
            self = .richTextSubscript(value)
        case .richTextSuperscript:
            let value = try RichTextSuperscript(from: decoder)
            self = .richTextSuperscript(value)
        case .richTextMarked:
            let value = try RichTextMarked(from: decoder)
            self = .richTextMarked(value)
        case .richTextPhoneNumber:
            let value = try RichTextPhoneNumber(from: decoder)
            self = .richTextPhoneNumber(value)
        case .richTextIcon:
            let value = try RichTextIcon(from: decoder)
            self = .richTextIcon(value)
        case .richTextReference:
            let value = try RichTextReference(from: decoder)
            self = .richTextReference(value)
        case .richTextAnchor:
            let value = try RichTextAnchor(from: decoder)
            self = .richTextAnchor(value)
        case .richTextAnchorLink:
            let value = try RichTextAnchorLink(from: decoder)
            self = .richTextAnchorLink(value)
        case .richTexts:
            let value = try RichTexts(from: decoder)
            self = .richTexts(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .richTextPlain(value):
            try container.encode(Kind.richTextPlain, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextBold(value):
            try container.encode(Kind.richTextBold, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextItalic(value):
            try container.encode(Kind.richTextItalic, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextUnderline(value):
            try container.encode(Kind.richTextUnderline, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextStrikethrough(value):
            try container.encode(Kind.richTextStrikethrough, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextFixed(value):
            try container.encode(Kind.richTextFixed, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextUrl(value):
            try container.encode(Kind.richTextUrl, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextEmailAddress(value):
            try container.encode(Kind.richTextEmailAddress, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextSubscript(value):
            try container.encode(Kind.richTextSubscript, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextSuperscript(value):
            try container.encode(Kind.richTextSuperscript, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextMarked(value):
            try container.encode(Kind.richTextMarked, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextPhoneNumber(value):
            try container.encode(Kind.richTextPhoneNumber, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextIcon(value):
            try container.encode(Kind.richTextIcon, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextReference(value):
            try container.encode(Kind.richTextReference, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextAnchor(value):
            try container.encode(Kind.richTextAnchor, forKey: .type)
            try value.encode(to: encoder)
        case let .richTextAnchorLink(value):
            try container.encode(Kind.richTextAnchorLink, forKey: .type)
            try value.encode(to: encoder)
        case let .richTexts(value):
            try container.encode(Kind.richTexts, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A plain text
internal struct RichTextPlain: Codable {
    /// Text
    internal let text: String

    internal init(text: String) {
        self.text = text
    }
}

/// A bold rich text
internal struct RichTextBold: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// An italicized rich text
internal struct RichTextItalic: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// An underlined rich text
internal struct RichTextUnderline: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A strikethrough rich text
internal struct RichTextStrikethrough: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A fixed-width rich text
internal struct RichTextFixed: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A rich text URL link
internal struct RichTextUrl: Codable {
    /// True, if the URL has cached instant view server-side
    internal let isCached: Bool

    /// Text
    internal let text: RichText

    /// URL
    internal let url: String

    internal init(
        isCached: Bool,
        text: RichText,
        url: String
    ) {
        self.isCached = isCached
        self.text = text
        self.url = url
    }
}

/// A rich text email link
internal struct RichTextEmailAddress: Codable {
    /// Email address
    internal let emailAddress: String

    /// Text
    internal let text: RichText

    internal init(
        emailAddress: String,
        text: RichText
    ) {
        self.emailAddress = emailAddress
        self.text = text
    }
}

/// A subscript rich text
internal struct RichTextSubscript: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A superscript rich text
internal struct RichTextSuperscript: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A marked rich text
internal struct RichTextMarked: Codable {
    /// Text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A rich text phone number
internal struct RichTextPhoneNumber: Codable {
    /// Phone number
    internal let phoneNumber: String

    /// Text
    internal let text: RichText

    internal init(
        phoneNumber: String,
        text: RichText
    ) {
        self.phoneNumber = phoneNumber
        self.text = text
    }
}

/// A small image inside the text
internal struct RichTextIcon: Codable {
    /// The image represented as a document. The image can be in GIF, JPEG or PNG format
    internal let document: Document

    /// Height of a bounding box in which the image should be shown; 0 if unknown
    internal let height: Int

    /// Width of a bounding box in which the image should be shown; 0 if unknown
    internal let width: Int

    internal init(
        document: Document,
        height: Int,
        width: Int
    ) {
        self.document = document
        self.height = height
        self.width = width
    }
}

/// A reference to a richTexts object on the same web page
internal struct RichTextReference: Codable {
    /// The name of a richTextAnchor object, which is the first element of the target richTexts object
    internal let anchorName: String

    /// The text
    internal let text: RichText

    /// An HTTP URL, opening the reference
    internal let url: String

    internal init(
        anchorName: String,
        text: RichText,
        url: String
    ) {
        self.anchorName = anchorName
        self.text = text
        self.url = url
    }
}

/// An anchor
internal struct RichTextAnchor: Codable {
    /// Anchor name
    internal let name: String

    internal init(name: String) {
        self.name = name
    }
}

/// A link to an anchor on the same web page
internal struct RichTextAnchorLink: Codable {
    /// The anchor name. If the name is empty, the link should bring back to top
    internal let anchorName: String

    /// The link text
    internal let text: RichText

    /// An HTTP URL, opening the anchor
    internal let url: String

    internal init(
        anchorName: String,
        text: RichText,
        url: String
    ) {
        self.anchorName = anchorName
        self.text = text
        self.url = url
    }
}

/// A concatenation of rich texts
internal struct RichTexts: Codable {
    /// Texts
    internal let texts: [RichText]

    internal init(texts: [RichText]) {
        self.texts = texts
    }
}
