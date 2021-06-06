import SwiftUI

public struct PhotoState: Hashable {
    public init(photo: ThumbnailState, caption: String) {
        self.photo = photo
        self.caption = caption
    }

    let photo: ThumbnailState
    let caption: String
}

struct PhotoContentView: View {
    @Environment(\.imageLoader) private var imageLoader
    let state: PhotoState
    let width: CGFloat

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            let photo = PhotoView(task: imageLoader.task(photo: state.photo))
                .frame(
                    width: width,
                    height: width / state.photo.aspectRatio,
                    alignment: .center
                )

            if needsClipping {
                photo.tgMessageClipping()
            } else {
                photo
            }

            if !state.caption.isEmpty {
                Text(state.caption)
                    .font(.tgTitle)
                    .padding(.tgTextPadding)
                    .frame(width: width)
            }
        }
    }

    private var needsClipping: Bool {
        width != .tgMessageWidth || state.caption.isEmpty
    }
}

struct PhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoContentView(state: .withCaption, width: .tgMessageWidth)
            PhotoContentView(state: .withoutCaption, width: .tgMessageWidth)
        }
        .tgMessageStyle(isOutgoing: true)
        .accentColor(.blue)
    }
}

extension PhotoState {
    static let withCaption = PhotoState(
        photo: .preview, caption: "🛰 Ocean clouds seen from space"
    )
    static let withoutCaption = PhotoState(
        photo: .preview, caption: ""
    )
}

extension ThumbnailState {
    static let preview = ThumbnailState(
        thumbnail: .init(file: .photo, format: .jpg, width: 4, height: 3),
        minithumbnail: nil
    )

    static let previewAvatar = ThumbnailState(
        thumbnail: .init(file: .userAvatar, format: .png, width: 4, height: 3),
        minithumbnail: nil
    )
}

extension LocalFileState {
    static let thumbnail = downloaded("Thumbnail.jpg")
    static let userAvatar = downloaded("user-avatar.png")
    static let photo = downloaded("Image.png")
    static let notLoaded = LocalFileState(fileId: -1, downloaded: false, path: "")
    static let video = downloaded("video.mp4")

    static func downloaded(_ path: String) -> LocalFileState {
        .init(
            fileId: 1,
            downloaded: true,
            path: .previewFilePath(path)
        )
    }
}

extension Image {
    static func preview(name: String) -> Image {
        let uiImage = UIImage(contentsOfFile: .previewFilePath(name))!
        return Image(uiImage: uiImage)
    }
}

extension String {
    static func previewFilePath(_ filename: String) -> String {
        URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Preview Content")
            .appendingPathComponent(filename)
            .path
    }
}
