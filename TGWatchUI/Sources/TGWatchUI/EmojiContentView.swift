import SwiftUI

struct EmojiContentView: View {
    private let emoji: String

    init(_ emoji: String) {
        self.emoji = emoji
    }

    var body: some View {
        Text(emoji)
            .font(.system(size: fontSize))
            .padding(.vertical, -1) // fix for SwiftUI padding in List
    }

    static func canRender(_ text: String) -> Bool {
        !text.isEmpty && text.count <= 3 && text.unicodeScalars.allSatisfy { $0.properties.isEmojiPresentation }
    }

    private var fontSize: CGFloat {
        switch emoji.count {
        case 1:
            return 68
        case 2:
            return 48
        case 3:
            return 48
        default:
            assertionFailure("unsupported")
            return 17
        }
    }
}

struct EmojiContentView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ZStack {
                Rectangle().frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                EmojiContentView("🥰")
                    .debugBorder()
            }
            .clearedListStyle()
            EmojiContentView("🏖🦘")
                .clearedListStyle()
            EmojiContentView("🍷🏖🦘")
                .clearedListStyle()
        }
    }
}
