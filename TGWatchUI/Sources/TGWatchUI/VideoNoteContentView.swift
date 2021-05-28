import SwiftUI

public class VideoNoteState {
    public init(duration: Int, thumbnail: LocalPhotoState, unplayed: Bool) {
        self.duration = duration
        self.thumbnail = thumbnail
        self.unplayed = unplayed
    }

    let duration: Int
    let thumbnail: LocalPhotoState
    let unplayed: Bool
}

public struct VideoNoteContentView: View {
    private let state: VideoNoteState

    public init(_ state: VideoNoteState) {
        self.state = state
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .center) {
                    image
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                    Image("BlurPlay", bundle: .module)
                }
                .clipShape(Circle())

                HStack(alignment: .center, spacing: 4) {
                    Text(state.duration.durationString)
                        .font(.tgSubtitle)
                        .foregroundColor(.tgGrey)

                    if state.unplayed {
                        UnreadIndicator()
                    }
                }
                .alignmentGuide(.trailing, computeValue: { _ in 25 })
            }
        }
    }

    @ViewBuilder
    private var image: some View {
        LocalPhotoView(photo: state.thumbnail)
            .background(Color.gray)
    }
}

struct VideoNoteContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoNoteContentView(.unplayed)
            // .tgMessageStyle(isOutgoing: true)
            .accentColor(.blue)
    }
}

extension VideoNoteState {
    static let unplayed = VideoNoteState(
        duration: 26, thumbnail: .preview, unplayed: true
    )
}
