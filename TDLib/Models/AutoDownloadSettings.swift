//
//  AutoDownloadSettings.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains auto-download settings
internal struct AutoDownloadSettings: Codable {
    /// True, if the auto-download is enabled
    internal let isAutoDownloadEnabled: Bool

    /// The maximum size of other file types to be auto-downloaded
    internal let maxOtherFileSize: Int

    /// The maximum size of a photo file to be auto-downloaded
    internal let maxPhotoFileSize: Int

    /// The maximum size of a video file to be auto-downloaded
    internal let maxVideoFileSize: Int

    /// True, if the beginning of video files needs to be preloaded for instant playback
    internal let preloadLargeVideos: Bool

    /// True, if the next audio track needs to be preloaded while the user is listening to an audio file
    internal let preloadNextAudio: Bool

    /// True, if "use less data for calls" option needs to be enabled
    internal let useLessDataForCalls: Bool

    /// The maximum suggested bitrate for uploaded videos
    internal let videoUploadBitrate: Int

    internal init(
        isAutoDownloadEnabled: Bool,
        maxOtherFileSize: Int,
        maxPhotoFileSize: Int,
        maxVideoFileSize: Int,
        preloadLargeVideos: Bool,
        preloadNextAudio: Bool,
        useLessDataForCalls: Bool,
        videoUploadBitrate: Int
    ) {
        self.isAutoDownloadEnabled = isAutoDownloadEnabled
        self.maxOtherFileSize = maxOtherFileSize
        self.maxPhotoFileSize = maxPhotoFileSize
        self.maxVideoFileSize = maxVideoFileSize
        self.preloadLargeVideos = preloadLargeVideos
        self.preloadNextAudio = preloadNextAudio
        self.useLessDataForCalls = useLessDataForCalls
        self.videoUploadBitrate = videoUploadBitrate
    }
}
