import SwiftUI

public struct StickerState: Hashable {
    public init(
        emoji: String,
        isAnimated: Bool,
        thumbnail: ThumbnailState,
        file: LocalFileState,
        width: Int,
        height: Int
    ) {
        self.emoji = emoji
        self.isAnimated = isAnimated
        self.thumbnail = thumbnail
        self.file = file
        self.width = width
        self.height = height
    }

    public let emoji: String
    public let isAnimated: Bool
    public let thumbnail: ThumbnailState
    public let file: LocalFileState
    public let width: Int
    public let height: Int
}

struct StickerContentView: View {
    @Environment(\.imageLoader) private var imageLoader
    let state: StickerState

    var body: some View {
        sticker
            // TODO: or keep aspect :notsureif:
            .frame(width: .tgStickerWidth, height: .tgStickerWidth)
    }

    @ViewBuilder
    private var sticker: some View {
        if state.isAnimated {
            TGSStickerView(player: imageLoader.player(sticker: state))
        } else {
            PhotoView(task: imageLoader.task(photo: state.thumbnail))
        }
    }
}
