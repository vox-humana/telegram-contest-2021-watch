//
//  WebPage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a web page preview
internal struct WebPage: Codable {
    /// Preview of the content as an animation, if available; may be null
    internal let animation: Animation?

    /// Preview of the content as an audio file, if available; may be null
    internal let audio: Audio?

    /// Author of the content
    internal let author: String

    internal let description: FormattedText

    /// URL to display
    internal let displayUrl: String

    /// Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null
    internal let document: Document?

    /// Duration of the content, in seconds
    internal let duration: Int

    /// Height of the embedded preview
    internal let embedHeight: Int

    /// MIME type of the embedded preview, (e.g., text/html or video/mp4)
    internal let embedType: String

    /// URL to show in the embedded preview
    internal let embedUrl: String

    /// Width of the embedded preview
    internal let embedWidth: Int

    /// Version of instant view, available for the web page (currently can be 1 or 2), 0 if none
    internal let instantViewVersion: Int

    /// Image representing the content; may be null
    internal let photo: Photo?

    /// Short name of the site (e.g., Google Docs, App Store)
    internal let siteName: String

    /// Preview of the content as a sticker for small WEBP files, if available; may be null
    internal let sticker: Sticker?

    /// Title of the content
    internal let title: String

    /// Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
    internal let type: String

    /// Original URL of the link
    internal let url: String

    /// Preview of the content as a video, if available; may be null
    internal let video: Video?

    /// Preview of the content as a video note, if available; may be null
    internal let videoNote: VideoNote?

    /// Preview of the content as a voice note, if available; may be null
    internal let voiceNote: VoiceNote?

    internal init(
        animation: Animation?,
        audio: Audio?,
        author: String,
        description: FormattedText,
        displayUrl: String,
        document: Document?,
        duration: Int,
        embedHeight: Int,
        embedType: String,
        embedUrl: String,
        embedWidth: Int,
        instantViewVersion: Int,
        photo: Photo?,
        siteName: String,
        sticker: Sticker?,
        title: String,
        type: String,
        url: String,
        video: Video?,
        videoNote: VideoNote?,
        voiceNote: VoiceNote?
    ) {
        self.animation = animation
        self.audio = audio
        self.author = author
        self.description = description
        self.displayUrl = displayUrl
        self.document = document
        self.duration = duration
        self.embedHeight = embedHeight
        self.embedType = embedType
        self.embedUrl = embedUrl
        self.embedWidth = embedWidth
        self.instantViewVersion = instantViewVersion
        self.photo = photo
        self.siteName = siteName
        self.sticker = sticker
        self.title = title
        self.type = type
        self.url = url
        self.video = video
        self.videoNote = videoNote
        self.voiceNote = voiceNote
    }
}
