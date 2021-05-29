//
//  GetMapThumbnailFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded
internal struct GetMapThumbnailFile: Codable {
    /// Identifier of a chat, in which the thumbnail will be shown. Use 0 if unknown
    internal let chatId: Int64

    /// Map height in pixels before applying scale; 16-1024
    internal let height: Int

    /// Location of the map center
    internal let location: Location

    /// Map scale; 1-3
    internal let scale: Int

    /// Map width in pixels before applying scale; 16-1024
    internal let width: Int

    /// Map zoom level; 13-20
    internal let zoom: Int

    internal init(
        chatId: Int64,
        height: Int,
        location: Location,
        scale: Int,
        width: Int,
        zoom: Int
    ) {
        self.chatId = chatId
        self.height = height
        self.location = location
        self.scale = scale
        self.width = width
        self.zoom = zoom
    }
}
