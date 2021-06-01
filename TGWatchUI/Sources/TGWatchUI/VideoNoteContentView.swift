import SwiftUI

public class VideoNoteState {
    public init(duration: Int, thumbnail: ThumbnailState, unplayed: Bool) {
        self.duration = duration
        self.thumbnail = thumbnail
        self.unplayed = unplayed
    }

    let duration: Int
    let thumbnail: ThumbnailState
    let unplayed: Bool
}

struct VideoNoteContentView: View {
    @Environment(\.imageLoader) private var imageLoader
    private let state: VideoNoteState

    init(_ state: VideoNoteState) {
        self.state = state
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .center) {
                    PhotoView(task: imageLoader.task(photo: state.thumbnail))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .tgStickerWidth, height: .tgStickerWidth)
                    Image("BlurPlay", bundle: .module)
                }
                .clipShape(Circle())

                HStack(alignment: .center, spacing: 4) {
                    Text(state.duration.durationString)
                        .font(.tgSubtitle)
                        .foregroundColor(.tgGrey)

                    if state.unplayed {
                        UnreadIndicator()
                            .foregroundColor(.accentColor)
                    }
                }
                .alignmentGuide(.trailing, computeValue: { _ in 25 })
            }
        }
    }
}

struct VideoNoteContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoNoteContentView(.unplayed)
            .accentColor(.blue)
    }
}

extension VideoNoteState {
    static let unplayed = VideoNoteState(
        duration: 26, thumbnail: .preview, unplayed: true
    )
}
