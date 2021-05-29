//
//  Audio.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an audio file. Audio is usually in MP3 or M4A format
internal struct Audio: Codable {
    /// The minithumbnail of the album cover; may be null
    internal let albumCoverMinithumbnail: Minithumbnail?

    /// The thumbnail of the album cover in JPEG format; as defined by the sender. The full size thumbnail should be extracted from the downloaded file; may be null
    internal let albumCoverThumbnail: Thumbnail?

    /// File containing the audio
    internal let audio: File

    /// Duration of the audio, in seconds; as defined by the sender
    internal let duration: Int

    /// Original name of the file; as defined by the sender
    internal let fileName: String

    /// The MIME type of the file; as defined by the sender
    internal let mimeType: String

    /// Performer of the audio; as defined by the sender
    internal let performer: String

    /// Title of the audio; as defined by the sender
    internal let title: String

    internal init(
        albumCoverMinithumbnail: Minithumbnail?,
        albumCoverThumbnail: Thumbnail?,
        audio: File,
        duration: Int,
        fileName: String,
        mimeType: String,
        performer: String,
        title: String
    ) {
        self.albumCoverMinithumbnail = albumCoverMinithumbnail
        self.albumCoverThumbnail = albumCoverThumbnail
        self.audio = audio
        self.duration = duration
        self.fileName = fileName
        self.mimeType = mimeType
        self.performer = performer
        self.title = title
    }
}
