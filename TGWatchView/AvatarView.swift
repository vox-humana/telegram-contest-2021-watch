import SwiftUI

import UIKit

protocol LocalPhotoPreview {
    var small: File { get }
    var minithumbnail: Minithumbnail? { get }
}

extension ChatPhotoInfo: LocalPhotoPreview {}
extension ProfilePhoto: LocalPhotoPreview {}

extension Photo: LocalPhotoPreview {
    var small: File {
        // https://core.telegram.org/api/files#image-thumbnail-types
        // TODO: sort all
        sizes.first(where: { $0.type == "m" || $0.type == "s" }).map(\.photo)!
    }
}

extension Video: LocalPhotoPreview {
    var small: File {
        // TODO: how to get thumbnail image?
        video
    }
}

struct AvatarView: View {
    let photo: LocalPhotoPreview?
    private let size: CGFloat = 24

    var body: some View {
        if let photo = photo, photo.canBeRendered {
            LocalPhotoView(photo: photo)
                .frame(width: size, height: size)
                .cornerRadius(size / 2)
        } else {
            Image(systemName: "person") // TODO: group / channel
                .frame(width: size, height: size)
        }
    }
}

// TODO: add caching
struct LocalPhotoView: View {
    private class LocalLoader: ObservableObject {
        var image: Image?

        init(file: File) {
            guard file.local.isDownloadingCompleted else {
                return
            }

            let fileURL = URL(fileURLWithPath: file.local.path)

            // background?
            guard
                let data = try? Data(contentsOf: fileURL),
                let uiImage = UIImage(data: data)
            else {
                assertionFailure("Can't read image from: \(file.local.path)")
                return
            }

            image = Image(uiImage: uiImage)
            objectWillChange.send()
        }
    }

    private class ThumbnailLoader: ObservableObject {
        var image: Image?

        func load(thumbnail: Minithumbnail) {
            // background?
            guard let uiImage = UIImage(data: thumbnail.data) else {
                assertionFailure("Can't create image from thumbnail data")
                return
            }
            image = Image(uiImage: uiImage)
            objectWillChange.send()
        }
    }

    @ObservedObject private var loader: LocalLoader
    @ObservedObject private var thumbnailLoader: ThumbnailLoader

    var body: some View {
        image?
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    init(photo: LocalPhotoPreview) {
        _loader = ObservedObject(
            wrappedValue: LocalLoader(file: photo.small)
        )
        _thumbnailLoader = ObservedObject(
            wrappedValue: ThumbnailLoader()
        )
        if !photo.small.local.isDownloadingCompleted, let thumbnail = photo.minithumbnail {
            thumbnailLoader.load(thumbnail: thumbnail)
        }
    }

    private var image: Image? {
        if let image = loader.image {
            return image
        } else {
            return thumbnailLoader.image
        }
    }
}

private extension LocalPhotoPreview {
    var downloaded: Bool {
        small.local.isDownloadingCompleted
    }

    var hasThumbnail: Bool {
        minithumbnail != nil
    }

    var canBeRendered: Bool {
        downloaded || hasThumbnail
    }
}
