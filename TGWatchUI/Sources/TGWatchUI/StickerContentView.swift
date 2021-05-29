import SwiftUI

public struct StickerState {
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
