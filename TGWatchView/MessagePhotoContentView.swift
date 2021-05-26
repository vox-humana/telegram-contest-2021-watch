import SwiftUI

public struct MessagePhotoContentView: View {
    let photo: MessagePhoto

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            image
            if !photo.caption.text.isEmpty {
                Text(photo.caption.text)
                    .padding(.tgTextPadding)
            }
        }
    }

    @ViewBuilder
    private var image: some View {
        LocalPhotoView(photo: photo.photo)
            .background(Color.gray)
    }
}

#if DEBUG
    struct MessagePhotoContentView_Previews: PreviewProvider {
        static var previews: some View {
            MessagePhotoContentView(photo: .withCaption)
                .accentColor(.blue)
        }
    }
#endif

public struct MessageVieoContentView: View {
    let video: MessageVideo

    public var body: some View {
        ZStack(alignment: .center) {
            image
            Image("BlurPlay")
        }
        if !video.caption.text.isEmpty {
            Text(video.caption.text)
        }
    }

    @ViewBuilder
    private var image: some View {
        LocalPhotoView(photo: video.video)
            .background(Color.gray)
    }
}
