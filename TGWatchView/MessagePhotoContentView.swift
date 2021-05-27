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
            Group {
                MessagePhotoContentView(photo: .withCaption)
                MessageVideoContentView(video: .withCaption)
            }
            .background(Color.gray)
            .accentColor(.blue)
        }
    }
#endif

public struct MessageVideoContentView: View {
    let video: MessageVideo

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .center) {
                    image
                    Image("BlurPlay")
                }
                Text(video.video.duration.durationString)
                    .font(.tgSubtitle)
                    .padding(EdgeInsets(top: 1, leading: 5, bottom: 2, trailing: 5))
                    .background(
                        Capsule(style: .circular)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    )
            }
            if !video.caption.text.isEmpty {
                Text(video.caption.text)
            }
        }
    }

    @ViewBuilder
    private var image: some View {
        LocalPhotoView(photo: video.video)
            .background(Color.gray)
    }
}

extension Int {
    var durationString: String {
        let hours = self / 3600
        let minutes = self / 60 % 60
        let seconds = self % 60
        if hours > 0 {
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
        return String(format: "%2i:%02i", minutes, seconds)
    }
}
