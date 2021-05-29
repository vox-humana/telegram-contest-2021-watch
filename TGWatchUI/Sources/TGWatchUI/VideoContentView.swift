import SwiftUI

public class VideoState {
    public init(caption: String, duration: Int, thumbnail: LocalPhotoState) {
        self.caption = caption
        self.duration = duration
        self.thumbnail = thumbnail
    }

    let caption: String
    let duration: Int
    let thumbnail: LocalPhotoState
}

public struct VideoContentView: View {
    private let state: VideoState

    public init(_ state: VideoState) {
        self.state = state
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .center) {
                    image
                    Image("BlurPlay", bundle: .module)
                }
                Text(state.duration.durationString)
                    .font(.tgSubtitle)
                    .padding(EdgeInsets(top: 1, leading: 5, bottom: 2, trailing: 5))
                    .background(
                        Capsule(style: .circular)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    )
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
            }
            if !state.caption.isEmpty {
                Text(state.caption)
                    .font(.tgTitle)
                    .padding(.tgTextPadding)
            }
        }
    }

    @ViewBuilder
    private var image: some View {
        LocalPhotoView(photo: state.thumbnail)
            .background(Color.gray)
    }
}

struct VideoContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VideoContentView(.withCaption)
            VideoContentView(.withoutCaption)
        }
        .tgMessageStyle(isOutgoing: true)
        .accentColor(.blue)
    }
}

extension VideoState {
    static let withCaption = VideoState(
        caption: "🛰 Ocean clouds seen from space",
        duration: 26,
        thumbnail: .preview
    )

    static let withoutCaption = VideoState(
        caption: "",
        duration: 26,
        thumbnail: .preview
    )
}
