import MapKit
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

    public init(state: AudioState) {
        self.state = state
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image("Play", bundle: .module)
                .renderingMode(.template)
            VStack(alignment: .leading) {
                if !state.caption.isEmpty {
                    Text(state.caption)
                } else {
                    Image("WavesFilled", bundle: .module)
                        .renderingMode(.template)
                }
                Text(state.duration.durationString)
            }
            .font(.tgTitle)
            Spacer()
        }
        .padding(8)
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
    static var previews: some View {
        VStack {
            AudioContentView(state: .preview)
                .tgMessageStyle(isOutgoing: true)
            AudioContentView(state: .previewWithCaption)
                .tgMessageStyle(isOutgoing: true)
        }
        .accentColor(.blue)

        VStack {
            AudioContentView(state: .preview)
                .tgMessageStyle(isOutgoing: false)
            AudioContentView(state: .previewWithCaption)
                .tgMessageStyle(isOutgoing: false)
        }
        .accentColor(.blue)
    }
}
