import SwiftUI

public struct VideoNoteState: Hashable {
    public init(duration: Int, thumbnail: ThumbnailState, file: LocalFileState, unplayed: Bool) {
        self.duration = duration
        self.thumbnail = thumbnail
        self.file = file
        self.unplayed = unplayed
    }

    let duration: Int
    let thumbnail: ThumbnailState
    let file: LocalFileState
    let unplayed: Bool
}

struct VideoNoteContentView: View {
    @Environment(\.imageLoader) private var imageLoader
    @State private var videoFilePath: String? = nil
    let state: VideoNoteState
    let playable: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .center) {
                    PhotoView(task: imageLoader.task(photo: state.thumbnail))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .tgStickerWidth, height: .tgStickerWidth)
                    Image("BlurPlay", bundle: .module)

                    if playable {
                        VidePlayerView(
                            filePath: $videoFilePath,
                            task: imageLoader.fileTask(file: state.file)
                        )
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .tgStickerWidth, height: .tgStickerWidth)
                    }
                }
                .clipShape(Circle())

                HStack(alignment: .center, spacing: 4) {
                    Text(state.duration.durationString)
                        .font(.tgSubtitle)
                        .foregroundColor(.tgGrey)

                    if state.unplayed {
                        UnreadIndicator()
                            .foregroundColor(.compatibleAccentColor)
                    }
                }
                .alignmentGuide(.trailing, computeValue: { _ in 25 })
            }
        }
    }
}

struct VideoNoteContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoNoteContentView(state: .unplayed, playable: false)
            .accentColor(.blue)
    }
}

extension VideoNoteState {
    static let unplayed = VideoNoteState(
        duration: 26, thumbnail: .preview, file: .video, unplayed: true
    )
}
