//
//  ChatPhotoInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains basic information about the photo of a chat
public struct ChatPhotoInfo: Codable {
    /// A big (640x640) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
    public let big: File

    /// True, if the photo has animated variant
    public let hasAnimation: Bool

    /// Chat photo minithumbnail; may be null
    public let minithumbnail: Minithumbnail?

    /// A small (160x160) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
    public var small: File

    public init(
        big: File,
        hasAnimation: Bool,
        minithumbnail: Minithumbnail?,
        small: File
    ) {
        self.big = big
        self.hasAnimation = hasAnimation
        self.minithumbnail = minithumbnail
        self.small = small
    }
}
