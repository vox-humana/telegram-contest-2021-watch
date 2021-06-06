import SwiftUI

public struct ThumbnailState: Hashable {
    public struct Thumbnail: Hashable {
        public init(file: LocalFileState, format: ThumbnailState.Thumbnail.Format, width: Int, height: Int) {
            self.file = file
            self.format = format
            self.width = width
            self.height = height
        }

        public enum Format: Hashable {
            case jpg
            case png
            case webp
            case gif
            case tgs
            case mpeg4
        }

        public let file: LocalFileState
        public let format: Format
        public let width: Int
        public let height: Int
    }

    public init(thumbnail: ThumbnailState.Thumbnail?, minithumbnail: MiniThumbnailState?) {
        self.thumbnail = thumbnail
        self.minithumbnail = minithumbnail
    }

    public let thumbnail: Thumbnail?
    public let minithumbnail: MiniThumbnailState?

    var aspectRatio: CGFloat {
        guard let thumbnail = thumbnail else {
            return 1
        }
        return CGFloat(thumbnail.width) / CGFloat(thumbnail.height)
    }
}

public struct LocalFileState: Hashable {
    public init(fileId: FileId, downloaded: Bool, path: String) {
        self.fileId = fileId
        self.downloaded = downloaded
        self.path = path
    }

    public let fileId: FileId
    public let downloaded: Bool
    public let path: String
}

public struct MiniThumbnailState: Hashable {
    public init(data: Data) {
        self.data = data
    }

    public let data: Data
}

// TODO: add caching
struct LocalPhotoView: View {
    private class LocalLoader: ObservableObject {
        var image: Image?

        init(file: LocalFileState?) {
            guard let file = file, file.downloaded else {
                return
            }

            let fileURL = URL(fileURLWithPath: file.path)

            // background?
            guard
                let data = try? Data(contentsOf: fileURL),
                let uiImage = UIImage(data: data)
            else {
                assertionFailure("Can't read image from: \(file.path)")
                return
            }

            image = Image(uiImage: uiImage)
            objectWillChange.send()
        }
    }

    private class ThumbnailLoader: ObservableObject {
        var image: Image?

        func load(thumbnail: MiniThumbnailState) {
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

    init(photo: ThumbnailState) {
        _loader = ObservedObject(
            wrappedValue: LocalLoader(file: photo.thumbnail?.file)
        )
        _thumbnailLoader = ObservedObject(
            wrappedValue: ThumbnailLoader()
        )
        if photo.thumbnail?.file.downloaded == false, let thumbnail = photo.minithumbnail {
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
