//
//  PageBlock.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a block of an instant view web page
internal indirect enum PageBlock: Codable {
    /// The title of a page
    case pageBlockTitle(PageBlockTitle)

    /// The subtitle of a page
    case pageBlockSubtitle(PageBlockSubtitle)

    /// The author and publishing date of a page
    case pageBlockAuthorDate(PageBlockAuthorDate)

    /// A header
    case pageBlockHeader(PageBlockHeader)

    /// A subheader
    case pageBlockSubheader(PageBlockSubheader)

    /// A kicker
    case pageBlockKicker(PageBlockKicker)

    /// A text paragraph
    case pageBlockParagraph(PageBlockParagraph)

    /// A preformatted text paragraph
    case pageBlockPreformatted(PageBlockPreformatted)

    /// The footer of a page
    case pageBlockFooter(PageBlockFooter)

    /// An empty block separating a page
    case pageBlockDivider

    /// An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor
    case pageBlockAnchor(PageBlockAnchor)

    /// A list of data blocks
    case pageBlockList(PageBlockList)

    /// A block quote
    case pageBlockBlockQuote(PageBlockBlockQuote)

    /// A pull quote
    case pageBlockPullQuote(PageBlockPullQuote)

    /// An animation
    case pageBlockAnimation(PageBlockAnimation)

    /// An audio file
    case pageBlockAudio(PageBlockAudio)

    /// A photo
    case pageBlockPhoto(PageBlockPhoto)

    /// A video
    case pageBlockVideo(PageBlockVideo)

    /// A voice note
    case pageBlockVoiceNote(PageBlockVoiceNote)

    /// A page cover
    case pageBlockCover(PageBlockCover)

    /// An embedded web page
    case pageBlockEmbedded(PageBlockEmbedded)

    /// An embedded post
    case pageBlockEmbeddedPost(PageBlockEmbeddedPost)

    /// A collage
    case pageBlockCollage(PageBlockCollage)

    /// A slideshow
    case pageBlockSlideshow(PageBlockSlideshow)

    /// A link to a chat
    case pageBlockChatLink(PageBlockChatLink)

    /// A table
    case pageBlockTable(PageBlockTable)

    /// A collapsible block
    case pageBlockDetails(PageBlockDetails)

    /// Related articles
    case pageBlockRelatedArticles(PageBlockRelatedArticles)

    /// A map
    case pageBlockMap(PageBlockMap)

    private enum Kind: String, Codable {
        case pageBlockTitle
        case pageBlockSubtitle
        case pageBlockAuthorDate
        case pageBlockHeader
        case pageBlockSubheader
        case pageBlockKicker
        case pageBlockParagraph
        case pageBlockPreformatted
        case pageBlockFooter
        case pageBlockDivider
        case pageBlockAnchor
        case pageBlockList
        case pageBlockBlockQuote
        case pageBlockPullQuote
        case pageBlockAnimation
        case pageBlockAudio
        case pageBlockPhoto
        case pageBlockVideo
        case pageBlockVoiceNote
        case pageBlockCover
        case pageBlockEmbedded
        case pageBlockEmbeddedPost
        case pageBlockCollage
        case pageBlockSlideshow
        case pageBlockChatLink
        case pageBlockTable
        case pageBlockDetails
        case pageBlockRelatedArticles
        case pageBlockMap
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .pageBlockTitle:
            let value = try PageBlockTitle(from: decoder)
            self = .pageBlockTitle(value)
        case .pageBlockSubtitle:
            let value = try PageBlockSubtitle(from: decoder)
            self = .pageBlockSubtitle(value)
        case .pageBlockAuthorDate:
            let value = try PageBlockAuthorDate(from: decoder)
            self = .pageBlockAuthorDate(value)
        case .pageBlockHeader:
            let value = try PageBlockHeader(from: decoder)
            self = .pageBlockHeader(value)
        case .pageBlockSubheader:
            let value = try PageBlockSubheader(from: decoder)
            self = .pageBlockSubheader(value)
        case .pageBlockKicker:
            let value = try PageBlockKicker(from: decoder)
            self = .pageBlockKicker(value)
        case .pageBlockParagraph:
            let value = try PageBlockParagraph(from: decoder)
            self = .pageBlockParagraph(value)
        case .pageBlockPreformatted:
            let value = try PageBlockPreformatted(from: decoder)
            self = .pageBlockPreformatted(value)
        case .pageBlockFooter:
            let value = try PageBlockFooter(from: decoder)
            self = .pageBlockFooter(value)
        case .pageBlockDivider:
            self = .pageBlockDivider
        case .pageBlockAnchor:
            let value = try PageBlockAnchor(from: decoder)
            self = .pageBlockAnchor(value)
        case .pageBlockList:
            let value = try PageBlockList(from: decoder)
            self = .pageBlockList(value)
        case .pageBlockBlockQuote:
            let value = try PageBlockBlockQuote(from: decoder)
            self = .pageBlockBlockQuote(value)
        case .pageBlockPullQuote:
            let value = try PageBlockPullQuote(from: decoder)
            self = .pageBlockPullQuote(value)
        case .pageBlockAnimation:
            let value = try PageBlockAnimation(from: decoder)
            self = .pageBlockAnimation(value)
        case .pageBlockAudio:
            let value = try PageBlockAudio(from: decoder)
            self = .pageBlockAudio(value)
        case .pageBlockPhoto:
            let value = try PageBlockPhoto(from: decoder)
            self = .pageBlockPhoto(value)
        case .pageBlockVideo:
            let value = try PageBlockVideo(from: decoder)
            self = .pageBlockVideo(value)
        case .pageBlockVoiceNote:
            let value = try PageBlockVoiceNote(from: decoder)
            self = .pageBlockVoiceNote(value)
        case .pageBlockCover:
            let value = try PageBlockCover(from: decoder)
            self = .pageBlockCover(value)
        case .pageBlockEmbedded:
            let value = try PageBlockEmbedded(from: decoder)
            self = .pageBlockEmbedded(value)
        case .pageBlockEmbeddedPost:
            let value = try PageBlockEmbeddedPost(from: decoder)
            self = .pageBlockEmbeddedPost(value)
        case .pageBlockCollage:
            let value = try PageBlockCollage(from: decoder)
            self = .pageBlockCollage(value)
        case .pageBlockSlideshow:
            let value = try PageBlockSlideshow(from: decoder)
            self = .pageBlockSlideshow(value)
        case .pageBlockChatLink:
            let value = try PageBlockChatLink(from: decoder)
            self = .pageBlockChatLink(value)
        case .pageBlockTable:
            let value = try PageBlockTable(from: decoder)
            self = .pageBlockTable(value)
        case .pageBlockDetails:
            let value = try PageBlockDetails(from: decoder)
            self = .pageBlockDetails(value)
        case .pageBlockRelatedArticles:
            let value = try PageBlockRelatedArticles(from: decoder)
            self = .pageBlockRelatedArticles(value)
        case .pageBlockMap:
            let value = try PageBlockMap(from: decoder)
            self = .pageBlockMap(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .pageBlockTitle(value):
            try container.encode(Kind.pageBlockTitle, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockSubtitle(value):
            try container.encode(Kind.pageBlockSubtitle, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockAuthorDate(value):
            try container.encode(Kind.pageBlockAuthorDate, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockHeader(value):
            try container.encode(Kind.pageBlockHeader, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockSubheader(value):
            try container.encode(Kind.pageBlockSubheader, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockKicker(value):
            try container.encode(Kind.pageBlockKicker, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockParagraph(value):
            try container.encode(Kind.pageBlockParagraph, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockPreformatted(value):
            try container.encode(Kind.pageBlockPreformatted, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockFooter(value):
            try container.encode(Kind.pageBlockFooter, forKey: .type)
            try value.encode(to: encoder)
        case .pageBlockDivider:
            try container.encode(Kind.pageBlockDivider, forKey: .type)
        case let .pageBlockAnchor(value):
            try container.encode(Kind.pageBlockAnchor, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockList(value):
            try container.encode(Kind.pageBlockList, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockBlockQuote(value):
            try container.encode(Kind.pageBlockBlockQuote, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockPullQuote(value):
            try container.encode(Kind.pageBlockPullQuote, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockAnimation(value):
            try container.encode(Kind.pageBlockAnimation, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockAudio(value):
            try container.encode(Kind.pageBlockAudio, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockPhoto(value):
            try container.encode(Kind.pageBlockPhoto, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockVideo(value):
            try container.encode(Kind.pageBlockVideo, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockVoiceNote(value):
            try container.encode(Kind.pageBlockVoiceNote, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockCover(value):
            try container.encode(Kind.pageBlockCover, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockEmbedded(value):
            try container.encode(Kind.pageBlockEmbedded, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockEmbeddedPost(value):
            try container.encode(Kind.pageBlockEmbeddedPost, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockCollage(value):
            try container.encode(Kind.pageBlockCollage, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockSlideshow(value):
            try container.encode(Kind.pageBlockSlideshow, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockChatLink(value):
            try container.encode(Kind.pageBlockChatLink, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockTable(value):
            try container.encode(Kind.pageBlockTable, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockDetails(value):
            try container.encode(Kind.pageBlockDetails, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockRelatedArticles(value):
            try container.encode(Kind.pageBlockRelatedArticles, forKey: .type)
            try value.encode(to: encoder)
        case let .pageBlockMap(value):
            try container.encode(Kind.pageBlockMap, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The title of a page
internal struct PageBlockTitle: Codable {
    /// Title
    internal let title: RichText

    internal init(title: RichText) {
        self.title = title
    }
}

/// The subtitle of a page
internal struct PageBlockSubtitle: Codable {
    /// Subtitle
    internal let subtitle: RichText

    internal init(subtitle: RichText) {
        self.subtitle = subtitle
    }
}

/// The author and publishing date of a page
internal struct PageBlockAuthorDate: Codable {
    /// Author
    internal let author: RichText

    /// Point in time (Unix timestamp) when the article was published; 0 if unknown
    internal let publishDate: Int

    internal init(
        author: RichText,
        publishDate: Int
    ) {
        self.author = author
        self.publishDate = publishDate
    }
}

/// A header
internal struct PageBlockHeader: Codable {
    /// Header
    internal let header: RichText

    internal init(header: RichText) {
        self.header = header
    }
}

/// A subheader
internal struct PageBlockSubheader: Codable {
    /// Subheader
    internal let subheader: RichText

    internal init(subheader: RichText) {
        self.subheader = subheader
    }
}

/// A kicker
internal struct PageBlockKicker: Codable {
    /// Kicker
    internal let kicker: RichText

    internal init(kicker: RichText) {
        self.kicker = kicker
    }
}

/// A text paragraph
internal struct PageBlockParagraph: Codable {
    /// Paragraph text
    internal let text: RichText

    internal init(text: RichText) {
        self.text = text
    }
}

/// A preformatted text paragraph
internal struct PageBlockPreformatted: Codable {
    /// Programming language for which the text should be formatted
    internal let language: String

    /// Paragraph text
    internal let text: RichText

    internal init(
        language: String,
        text: RichText
    ) {
        self.language = language
        self.text = text
    }
}

/// The footer of a page
internal struct PageBlockFooter: Codable {
    /// Footer
    internal let footer: RichText

    internal init(footer: RichText) {
        self.footer = footer
    }
}

/// An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor
internal struct PageBlockAnchor: Codable {
    /// Name of the anchor
    internal let name: String

    internal init(name: String) {
        self.name = name
    }
}

/// A list of data blocks
internal struct PageBlockList: Codable {
    /// The items of the list
    internal let items: [PageBlockListItem]

    internal init(items: [PageBlockListItem]) {
        self.items = items
    }
}

/// A block quote
internal struct PageBlockBlockQuote: Codable {
    /// Quote credit
    internal let credit: RichText

    /// Quote text
    internal let text: RichText

    internal init(
        credit: RichText,
        text: RichText
    ) {
        self.credit = credit
        self.text = text
    }
}

/// A pull quote
internal struct PageBlockPullQuote: Codable {
    /// Quote credit
    internal let credit: RichText

    /// Quote text
    internal let text: RichText

    internal init(
        credit: RichText,
        text: RichText
    ) {
        self.credit = credit
        self.text = text
    }
}

/// An animation
internal struct PageBlockAnimation: Codable {
    /// Animation file; may be null
    internal let animation: Animation?

    /// Animation caption
    internal let caption: PageBlockCaption

    /// True, if the animation should be played automatically
    internal let needAutoplay: Bool

    internal init(
        animation: Animation?,
        caption: PageBlockCaption,
        needAutoplay: Bool
    ) {
        self.animation = animation
        self.caption = caption
        self.needAutoplay = needAutoplay
    }
}

/// An audio file
internal struct PageBlockAudio: Codable {
    /// Audio file; may be null
    internal let audio: Audio?

    /// Audio file caption
    internal let caption: PageBlockCaption

    internal init(
        audio: Audio?,
        caption: PageBlockCaption
    ) {
        self.audio = audio
        self.caption = caption
    }
}

/// A photo
internal struct PageBlockPhoto: Codable {
    /// Photo caption
    internal let caption: PageBlockCaption

    /// Photo file; may be null
    internal let photo: Photo?

    /// URL that needs to be opened when the photo is clicked
    internal let url: String

    internal init(
        caption: PageBlockCaption,
        photo: Photo?,
        url: String
    ) {
        self.caption = caption
        self.photo = photo
        self.url = url
    }
}

/// A video
internal struct PageBlockVideo: Codable {
    /// Video caption
    internal let caption: PageBlockCaption

    /// True, if the video should be looped
    internal let isLooped: Bool

    /// True, if the video should be played automatically
    internal let needAutoplay: Bool

    /// Video file; may be null
    internal let video: Video?

    internal init(
        caption: PageBlockCaption,
        isLooped: Bool,
        needAutoplay: Bool,
        video: Video?
    ) {
        self.caption = caption
        self.isLooped = isLooped
        self.needAutoplay = needAutoplay
        self.video = video
    }
}

/// A voice note
internal struct PageBlockVoiceNote: Codable {
    /// Voice note caption
    internal let caption: PageBlockCaption

    /// Voice note; may be null
    internal let voiceNote: VoiceNote?

    internal init(
        caption: PageBlockCaption,
        voiceNote: VoiceNote?
    ) {
        self.caption = caption
        self.voiceNote = voiceNote
    }
}

/// A page cover
internal struct PageBlockCover: Codable {
    /// Cover
    internal let cover: PageBlock

    internal init(cover: PageBlock) {
        self.cover = cover
    }
}

/// An embedded web page
internal struct PageBlockEmbedded: Codable {
    /// True, if scrolling should be allowed
    internal let allowScrolling: Bool

    /// Block caption
    internal let caption: PageBlockCaption

    /// Block height; 0 if unknown
    internal let height: Int

    /// HTML-markup of the embedded page
    internal let html: String

    /// True, if the block should be full width
    internal let isFullWidth: Bool

    /// Poster photo, if available; may be null
    internal let posterPhoto: Photo?

    /// Web page URL, if available
    internal let url: String

    /// Block width; 0 if unknown
    internal let width: Int

    internal init(
        allowScrolling: Bool,
        caption: PageBlockCaption,
        height: Int,
        html: String,
        isFullWidth: Bool,
        posterPhoto: Photo?,
        url: String,
        width: Int
    ) {
        self.allowScrolling = allowScrolling
        self.caption = caption
        self.height = height
        self.html = html
        self.isFullWidth = isFullWidth
        self.posterPhoto = posterPhoto
        self.url = url
        self.width = width
    }
}

/// An embedded post
internal struct PageBlockEmbeddedPost: Codable {
    /// Post author
    internal let author: String

    /// Post author photo; may be null
    internal let authorPhoto: Photo?

    /// Post caption
    internal let caption: PageBlockCaption

    /// Point in time (Unix timestamp) when the post was created; 0 if unknown
    internal let date: Int

    /// Post content
    internal let pageBlocks: [PageBlock]

    /// Web page URL
    internal let url: String

    internal init(
        author: String,
        authorPhoto: Photo?,
        caption: PageBlockCaption,
        date: Int,
        pageBlocks: [PageBlock],
        url: String
    ) {
        self.author = author
        self.authorPhoto = authorPhoto
        self.caption = caption
        self.date = date
        self.pageBlocks = pageBlocks
        self.url = url
    }
}

/// A collage
internal struct PageBlockCollage: Codable {
    /// Block caption
    internal let caption: PageBlockCaption

    /// Collage item contents
    internal let pageBlocks: [PageBlock]

    internal init(
        caption: PageBlockCaption,
        pageBlocks: [PageBlock]
    ) {
        self.caption = caption
        self.pageBlocks = pageBlocks
    }
}

/// A slideshow
internal struct PageBlockSlideshow: Codable {
    /// Block caption
    internal let caption: PageBlockCaption

    /// Slideshow item contents
    internal let pageBlocks: [PageBlock]

    internal init(
        caption: PageBlockCaption,
        pageBlocks: [PageBlock]
    ) {
        self.caption = caption
        self.pageBlocks = pageBlocks
    }
}

/// A link to a chat
internal struct PageBlockChatLink: Codable {
    /// Chat photo; may be null
    internal let photo: ChatPhotoInfo?

    /// Chat title
    internal let title: String

    /// Chat username, by which all other information about the chat should be resolved
    internal let username: String

    internal init(
        photo: ChatPhotoInfo?,
        title: String,
        username: String
    ) {
        self.photo = photo
        self.title = title
        self.username = username
    }
}

/// A table
internal struct PageBlockTable: Codable {
    /// Table caption
    internal let caption: RichText

    /// Table cells
    internal let cells: [[PageBlockTableCell]]

    /// True, if the table is bordered
    internal let isBordered: Bool

    /// True, if the table is striped
    internal let isStriped: Bool

    internal init(
        caption: RichText,
        cells: [[PageBlockTableCell]],
        isBordered: Bool,
        isStriped: Bool
    ) {
        self.caption = caption
        self.cells = cells
        self.isBordered = isBordered
        self.isStriped = isStriped
    }
}

/// A collapsible block
internal struct PageBlockDetails: Codable {
    /// Always visible heading for the block
    internal let header: RichText

    /// True, if the block is open by default
    internal let isOpen: Bool

    /// Block contents
    internal let pageBlocks: [PageBlock]

    internal init(
        header: RichText,
        isOpen: Bool,
        pageBlocks: [PageBlock]
    ) {
        self.header = header
        self.isOpen = isOpen
        self.pageBlocks = pageBlocks
    }
}

/// Related articles
internal struct PageBlockRelatedArticles: Codable {
    /// List of related articles
    internal let articles: [PageBlockRelatedArticle]

    /// Block header
    internal let header: RichText

    internal init(
        articles: [PageBlockRelatedArticle],
        header: RichText
    ) {
        self.articles = articles
        self.header = header
    }
}

/// A map
internal struct PageBlockMap: Codable {
    /// Block caption
    internal let caption: PageBlockCaption

    /// Map height
    internal let height: Int

    /// Location of the map center
    internal let location: Location

    /// Map width
    internal let width: Int

    /// Map zoom level
    internal let zoom: Int

    internal init(
        caption: PageBlockCaption,
        height: Int,
        location: Location,
        width: Int,
        zoom: Int
    ) {
        self.caption = caption
        self.height = height
        self.location = location
        self.width = width
        self.zoom = zoom
    }
}
