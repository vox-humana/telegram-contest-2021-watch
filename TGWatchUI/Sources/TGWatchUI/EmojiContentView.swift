import SwiftUI

public struct EmojiContentView: View {
    private let emoji: String

    public init(_ emoji: String) {
        self.emoji = emoji
    }

    public var body: some View {
        Text(emoji)
            .font(.system(size: fontSize))
    }

    public static func canRender(_ text: String) -> Bool {
        !text.isEmpty && text.count <= 3 && text.unicodeScalars.allSatisfy { $0.properties.isEmojiPresentation }
    }

    private var fontSize: CGFloat {
        switch emoji.count {
        case 1:
            return 64
        case 2:
            return 48
        case 3:
            return 32
        default:
            assertionFailure("unsupported")
            return 17
        }
    }
}

struct EmojiContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EmojiContentView("🦘")
            EmojiContentView("🏖🦘")
            EmojiContentView("🍷🏖🦘")
        }
    }
}
