import SwiftUI

public struct VideoState: Hashable {
    public init(caption: String, duration: Int, thumbnail: ThumbnailState, file: LocalFileState) {
        self.caption = caption
        self.duration = duration
        self.thumbnail = thumbnail
        self.file = file
    }

    let caption: String
    let duration: Int
    let thumbnail: ThumbnailState
    let file: LocalFileState
}

struct VidePlayerView: View {
    @Binding var filePath: String?
    let task: FileLoadingTask

    var body: some View {
        ZStack {
            if let path = filePath {
                InlineMovieView(movieURL: URL(fileURLWithPath: path))
            }
        }
        // TODO: cancel on disappear
        .onReceive(task.file) { file in
            DispatchQueue.main.async {
                self.filePath = file
            }
        }
    }
}

struct VideoContentView: View {
    @Environment(\.imageLoader) private var imageLoader
    let state: VideoState
    let width: CGFloat
    let playable: Bool

    @State private var videoFilePath: String? = nil

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            let thumbnail = ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .center) {
                    PhotoView(task: imageLoader.task(photo: state.thumbnail))
                        .frame(
                            width: width,
                            height: width / state.thumbnail.aspectRatio,
                            alignment: .center
                        )

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

                if playable {
                    VidePlayerView(
                        filePath: $videoFilePath, task: imageLoader.fileTask(file: state.file)
                    )
                    .frame(
                        width: width,
                        height: width / state.thumbnail.aspectRatio,
                        alignment: .center
                    )
                }
            }

            if needsClipping {
                thumbnail.tgMessageClipping()
            } else {
                thumbnail
            }

            if showCaption {
                Text(state.caption)
                    .font(.tgTitle)
                    .padding(.tgTextPadding)
                    .frame(width: width)
            }
        }
    }

    private var showCaption: Bool {
        !state.caption.isEmpty
    }

    private var needsClipping: Bool {
        width != .tgMessageWidth || !showCaption
    }
}

struct VideoContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VideoContentView(state: .withCaption, width: .tgMessageWidth, playable: false)
            VideoContentView(state: .withoutCaption, width: .tgMessageWidth, playable: false)
        }
        .tgMessageStyle(isOutgoing: true)
        .accentColor(.blue)
        .environment(
            \.imageLoader,
            DummyImageLoader(image: .preview(name: "Image.png"), filePath: .previewFilePath("video.mp4"))
        )
    }
}

extension VideoState {
    static let withCaption = VideoState(
        caption: "🛰 Ocean clouds seen from space",
        duration: 26,
        thumbnail: .preview,
        file: .video
    )

    static let withoutCaption = VideoState(
        caption: "",
        duration: 26,
        thumbnail: .preview,
        file: .video
    )
}
