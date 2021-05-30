import SwiftUI

public struct StickerState {
    public init(emoji: String, isAnimated: Bool) {
        self.emoji = emoji
        self.isAnimated = isAnimated
    }

    let emoji: String
    let isAnimated: Bool
}

public struct StickerContentView: View {
    let state: StickerState

    public init(_ state: StickerState) {
        self.state = state
    }

    public var body: some View {
        Text(state.emoji)
    }
}
