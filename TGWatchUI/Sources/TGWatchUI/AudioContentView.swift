import SwiftUI

public class AudioState {
    public init(caption: String, duration: Int, unplayed: Bool) {
        self.caption = caption
        self.duration = duration
        self.unplayed = unplayed
    }

    let caption: String
    let duration: Int
    let unplayed: Bool
}

public struct AudioContentView: View {
    let state: AudioState
    let keepImageColors: Bool

    public init(_ state: AudioState, keepImageColors: Bool) {
        self.state = state
        self.keepImageColors = keepImageColors
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            image("Play")

            VStack(alignment: .leading) {
                if !state.caption.isEmpty {
                    Text(state.caption)
                } else {
                    image("WavesFilled")
                }
                Text(state.duration.durationString)
            }
            .padding(contentPagging)
            .font(.tgTitle)
            Spacer()
        }
        .padding(8)
    }

    private func image(_ name: String) -> some View {
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
        caption: "", duration: 26, unplayed: true
    )
    static let previewWithCaption = AudioState(
        caption: "Name", duration: 26, unplayed: true
    )
}

struct AudioContentView_Previews: PreviewProvider {
    private static let outgoing = [true, false]

    static var previews: some View {
        ForEach(outgoing) { flag in
            VStack {
                AudioContentView(.preview, keepImageColors: !flag)
                    .tgMessageStyle(isOutgoing: flag)
                AudioContentView(.previewWithCaption, keepImageColors:!flag)
                    .tgMessageStyle(isOutgoing: flag)
            }
            .accentColor(.blue)
        }
    }
}

extension Bool: Identifiable {
    public var id: Bool { self }
}
