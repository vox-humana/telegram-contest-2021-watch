import SwiftUI

public struct AvatarView: View {
    let state: LocalPhotoState?
    private let size: CGFloat = 24

    public init(_ state: LocalPhotoState?) {
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

private extension LocalPhotoState {
    var canBeRendered: Bool {
        file.downloaded || minithumbnail != nil
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            AvatarView(LocalPhotoState(file: .userAvatar, minithumbnail: nil))
            AvatarView(LocalPhotoState(file: .notLoaded, minithumbnail: nil))
            AvatarView(nil)
        }
        .accentColor(.blue)
    }
}
