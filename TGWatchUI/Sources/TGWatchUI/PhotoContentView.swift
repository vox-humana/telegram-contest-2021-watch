import SwiftUI

public struct PhotoState {
    public init(photo: LocalPhotoState, caption: String) {
        self.photo = photo
        self.caption = caption
    }

    let photo: LocalPhotoState
    let caption: String
}

public struct PhotoContentView: View {
    let state: PhotoState

    public init(_ state: PhotoState) {
        self.state = state
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            image
            if !state.caption.isEmpty {
                Text(state.caption)
                    .font(.tgTitle)
                    .padding(.tgTextPadding)
            }
        }
    }

    @ViewBuilder
    private var image: some View {
        LocalPhotoView(photo: state.photo)
            .background(Color.gray)
    }
}

struct PhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoContentView(.withCaption)
            PhotoContentView(.withoutCaption)
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

extension LocalPhotoState {
    static let preview = LocalPhotoState(
        file: .photo,
        minithumbnail: nil
    )
}

extension LocalFileState {
    static let thumbnail = downloaded("Thumbnail.jpg")
    static let userAvatar = downloaded("user-avatar.png")
    static let photo = downloaded("Image.png")
    static let notLoaded = LocalFileState(downloaded: false, path: "")

    static func downloaded(_ path: String) -> LocalFileState {
        .init(
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
