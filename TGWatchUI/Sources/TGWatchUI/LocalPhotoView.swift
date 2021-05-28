import SwiftUI

public struct LocalPhotoState {
    public init(file: LocalFileState, minithumbnail: MiniThumbnailState?) {
        self.file = file
        self.minithumbnail = minithumbnail
    }

    let file: LocalFileState
    let minithumbnail: MiniThumbnailState?
}

public struct LocalFileState {
    public init(downloaded: Bool, path: String) {
        self.downloaded = downloaded
        self.path = path
    }

    let downloaded: Bool
    let path: String
}

public struct MiniThumbnailState {
    public init(data: Data) {
        self.data = data
    }

    let data: Data
}

// TODO: add caching
struct LocalPhotoView: View {
    private class LocalLoader: ObservableObject {
        var image: Image?

        init(file: LocalFileState) {
            guard file.downloaded else {
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

    init(photo: LocalPhotoState) {
        _loader = ObservedObject(
            wrappedValue: LocalLoader(file: photo.file)
        )
        _thumbnailLoader = ObservedObject(
            wrappedValue: ThumbnailLoader()
        )
        if !photo.file.downloaded, let thumbnail = photo.minithumbnail {
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
