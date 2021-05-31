import SwiftUI

public struct PhotoState {
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
        VStack(alignment: .leading, spacing: 0) {
            PhotoView(task: imageLoader.task(photo: state.photo))
                .frame(
                    width: width,
                    height: width / state.photo.aspectRatio,
                    alignment: .center
                )

            if !state.caption.isEmpty {
                Text(state.caption)
                    .font(.tgTitle)
                    .padding(.tgTextPadding)
            }
        }
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

    static func downloaded(_ path: String) -> LocalFileState {
        .init(
            fileId: 1,
            downloaded: true,
            path: imagePath(path)
        )
    }

    private static func imagePath(_ filename: String) -> String {
        URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Preview Content")
            .appendingPathComponent(filename)
            .path
    }
}
