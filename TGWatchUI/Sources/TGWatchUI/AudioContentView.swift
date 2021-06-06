import SwiftUI

public struct AudioState: Hashable {
    public init(title: String, caption: String, duration: Int, unplayed: Bool) {
        self.title = title
        self.caption = caption
        self.duration = duration
        self.unplayed = unplayed
    }

    let title: String
    let caption: String
    let duration: Int
    let unplayed: Bool
}

struct AudioContentView: View {
    let state: AudioState
    let keepImageColors: Bool

    init(_ state: AudioState, keepImageColors: Bool) {
        self.state = state
        self.keepImageColors = keepImageColors
    }

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            image("Play")

            VStack(alignment: .leading, spacing: 2) {
                if !state.title.isEmpty {
                    Text(state.title)
                        .lineLimit(1)
                } else {
                    // TODO: replace with real waves
                    image("WavesFilled")
                        .frame(maxWidth: .tgMessageWidth - 70)
                        .clipped()
                }
                HStack {
                    Text(state.duration.durationString)
                    if state.unplayed {
                        if keepImageColors {
                            UnreadIndicator().foregroundColor(.compatibleAccentColor)
                        } else {
                            UnreadIndicator()
                        }
                    }
                }
            }
            .font(.tgTitle)
            Spacer()
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
    }

    private func image(_ name: String) -> Image {
        let image = Image(name, bundle: .module)
        return keepImageColors ? image : image.renderingMode(.template)
    }

    private var contentPagging: EdgeInsets {
        state.caption.isEmpty
            ? EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0)
            : EdgeInsets(top: 1, leading: 0, bottom: 3, trailing: 0)
    }
}

extension AudioState {
    static let preview = AudioState(
        title: "", caption: "", duration: 26, unplayed: true
    )
    static let previewWithCaption = AudioState(
        title: "Long title of the track", caption: "Caption", duration: 26, unplayed: true
    )
}

struct AudioContentView_Previews: PreviewProvider {
    private static let outgoing = [true, false]

    static var previews: some View {
        DevicePreview {
            ForEach(outgoing) { flag in
                VStack {
                    AudioContentView(.preview, keepImageColors: !flag)
                        .tgMessageStyle(isOutgoing: flag)
                    AudioContentView(.previewWithCaption, keepImageColors:!flag)
                        .tgMessageStyle(isOutgoing: flag)
                }
                .frame(width: .tgMessageWidth)
            }
        }
    }
}

extension Bool: Identifiable {
    public var id: Bool { self }
}
