import SwiftUI

public struct AvatarView: View {
    let state: ThumbnailState?
    private let size: CGFloat = 24

    public init(_ state: ThumbnailState?) {
        self.state = state
    }

    public var body: some View {
        if let photo = state, photo.canBeRendered {
            LocalPhotoView(photo: photo)
                .frame(width: size, height: size)
                .cornerRadius(size / 2)
        } else {
            Image(systemName: "person") // TODO: group / channel
                .frame(width: size, height: size)
        }
    }
}

private extension ThumbnailState {
    var canBeRendered: Bool {
        thumbnail?.file.downloaded == true || minithumbnail != nil
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            AvatarView(.previewAvatar)
            AvatarView(.previewAvatar)
            AvatarView(nil)
        }
        .accentColor(.blue)
    }
}
