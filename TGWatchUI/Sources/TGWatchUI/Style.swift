import SwiftUI

// All screen sizes https://developer.apple.com/design/human-interface-guidelines/watchos/visual/layout/

public struct AccentStyle: ButtonStyle {
    private let color = Color.accentColor // doesn't work on watchOS 6
    // private let color = Color("AccentColor") // doesn't work on watchOS 6

    public init() {}

    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .font(.tgTitle)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
            )
    }
}

struct AccentStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("New Message") {}
            .buttonStyle(AccentStyle())
    }
}

public extension Font {
    static let tgTitle = Font.system(size: 17)
    static let tgLoginTitle = tgTitle.weight(.medium)
    static let tgChatTitle = tgTitle.weight(.medium)
    static let tgSubtitle = Font.system(size: 14)
    static let tgBadgeCount = tgSubtitle
}

public extension Color {
    static let tgGrey = Color.secondary
    static let tgBlack = Color.black
}

extension CGFloat {
    static let tgMessageCornerRadius: CGFloat = 14
    // static let tgMessageWidth: CGFloat = 160

    static var tgMessageWidth: CGFloat = {
        // Keeping the same ratio for all screens
        screenWidth / 184 * 160
    }()

    static var screenWidth: CGFloat = {
        WKInterfaceDevice.current().screenBounds.width
    }()
}

struct TGMessage: ViewModifier {
    let isOutgoing: Bool
    let hideBackground: Bool
    let ignoreClipping: Bool

    func body(content: Content) -> some View {
        let message = addBackground(content)

        if !ignoreClipping {
            message
                .clipShape(
                    RoundedRectangle(cornerRadius: .tgMessageCornerRadius, style: .circular)
                )
        } else {
            message
        }
    }

    @ViewBuilder
    private func addBackground(_ content: Content) -> some View {
        if !hideBackground {
            content
                .foregroundColor(isOutgoing ? Color.white : Color.tgBlack)
                .background(isOutgoing ? Color.accentColor : Color.white)
        } else {
            content
        }
    }
}

public extension View {
    func tgMessageStyle(isOutgoing: Bool, hideBackground: Bool = false, ignoreClipping: Bool = false) -> some View {
        modifier(
            TGMessage(
                isOutgoing: isOutgoing,
                hideBackground: hideBackground,
                ignoreClipping: ignoreClipping
            )
        )
    }
}

public extension View {
    func tgMessageStyle(_ message: MessageState) -> some View {
        modifier(
            TGMessage(
                isOutgoing: message.isOutgoing,
                hideBackground: message.content.hiddenBackground,
                ignoreClipping: message.content.hiddenBackground
            )
        )
    }
}

extension MessageContentState {
    var hiddenBackground: Bool {
        switch self {
        case let .text(text) where EmojiContentView.canRender(text):
            return true
        case .videoNote:
            return true
        case .sticker:
            return true
        default:
            return false
        }
    }
}

extension Int {
    var durationString: String {
        let hours = self / 3600
        let minutes = self / 60 % 60
        let seconds = self % 60
        if hours > 0 {
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
        return String(format: "%i:%02i", minutes, seconds)
    }
}

public extension EdgeInsets {
    static let tgTextPadding = EdgeInsets(top: 3, leading: 9, bottom: 5, trailing: 9)
}

// watchOS7+ 'Text(_:style:)'
extension DateFormatter {
    public static func time(from date: Date) -> String {
        timeFormatter.string(from: date)
    }

    public static func date(from date: Date) -> String {
        dateFormatter.string(from: date)
    }

    private static var timeFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    private static var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
