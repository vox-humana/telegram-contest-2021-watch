import MapKit
import TGWatchUI

extension AudioState {
    convenience init(_ message: MessageAudio) {
        self.init(
            caption: message.caption.text,
            duration: message.audio.duration,
            unplayed: false // TODO: ?
        )
    }
}

extension LocationState {
    init(_ message: MessageLocation) {
        self.init(
            location: CLLocationCoordinate2D(
                latitude: message.location.latitude,
                longitude: message.location.longitude
            ),
            isLive: message.livePeriod > 0
        )
    }
}

extension VideoState {
    convenience init(_ message: MessageVideo) {
        self.init(
            caption: message.caption.text,
            duration: message.video.duration,
            thumbnail: LocalPhotoState(
                file: LocalFileState(video: message.video),
                minithumbnail: MiniThumbnailState(message.video.minithumbnail)
            )
        )
    }
}

extension PhotoState {
    init(_ message: MessagePhoto) {
        self.init(
            photo: LocalPhotoState(
                file: .init(photo: message.photo),
                minithumbnail: MiniThumbnailState(message.photo.minithumbnail)
            ),
            caption: message.caption.text
        )
    }
}

extension LocalFileState {
    init(video: Video) {
        self.init(
            file: video.video
        )
    }
}

extension LocalFileState {
    init(photo: Photo) {
        self.init(
            file: photo.small
        )
    }
}

extension LocalPhotoState {
    init(chatPhoto: ChatPhotoInfo) {
        self.init(
            file: .init(file: chatPhoto.small),
            minithumbnail: MiniThumbnailState(chatPhoto.minithumbnail)
        )
    }

    init(profilePhoto: ProfilePhoto) {
        self.init(
            file: .init(file: profilePhoto.small),
            minithumbnail: MiniThumbnailState(profilePhoto.minithumbnail)
        )
    }
}

extension LocalFileState {
    init(file: File) {
        self.init(
            downloaded: file.local.isDownloadingCompleted,
            path: file.local.path
        )
    }
}

extension MiniThumbnailState {
    init?(_ minithumbnail: Minithumbnail?) {
        guard let thumbnail = minithumbnail else {
            return nil
        }
        self.init(data: thumbnail.data)
    }
}

extension VideoNoteState {
    convenience init(_ message: MessageVideoNote) {
        self.init(
            duration: message.videoNote.duration,
            thumbnail: .init(
                file: .init(file: message.videoNote.video),
                minithumbnail: MiniThumbnailState(message.videoNote.minithumbnail)
            ),
            unplayed: !message.isViewed
        )
    }
}

extension ContactState {
    convenience init(_ message: MessageContact) {
        self.init(
            name: "\(message.contact.firstName) \(message.contact.lastName)",
            phoneNumber: message.contact.phoneNumber
        )
    }
}

extension DocumentState {
    convenience init(_ message: MessageDocument) {
        self.init(
            fileName: message.caption.text.isEmpty ? message.document.fileName : message.caption.text,
            size: Int64(message.document.document.expectedSize)
        )
    }
}

private extension Photo {
    var small: File {
        // https://core.telegram.org/api/files#image-thumbnail-types
        // TODO: sort all
        sizes.first(where: { $0.type == "m" || $0.type == "s" }).map(\.photo)!
    }
}
