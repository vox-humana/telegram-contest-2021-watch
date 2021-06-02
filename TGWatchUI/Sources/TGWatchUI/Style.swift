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
    static let tgSender = Font.system(size: 14).weight(.medium)
    static let tgBadgeCount = tgSubtitle
    static let tgPollNumber = Font.custom("SF Compact Rounded", size: 11).weight(.medium)
}

public extension Color {
    static let tgGrey = Color(hex: 0x8E8E93) // Color.secondary
    static let tgBlack = Color.black
    static let tgGreyPlatter = Color(hex: 0x222223)
    static let tgGreen = Color(hex: 0x00B15A)
    static let tgRed = Color(hex: 0xFE3C30)
}

extension CGFloat {
    static let tgMessageCornerRadius: CGFloat = 14
    // static let tgMessageWidth: CGFloat = 160

    static var tgMessageWidth: CGFloat = {
        // Keeping the same ratio for all screens
        screenWidth / 184 * 160
    }()

    static var tgStickerWidth: CGFloat = {
        screenWidth / 184 * 140
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
        case .poll:
            // Poll has its own style inside
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

// https://github.com/overtake/TelegramSwift/blob/master/submodules/TGUIKit/TGUIKit/PresentationTheme.swift
private let userColors: [Color] = [
    .tgRed, // red
    Color(hex: 0xFF9502), // orange
    Color(hex: 0x787AFF), // purple
    .tgGreen, // green
    Color(hex: 0x28C9B7), // cyan
    Color(hex: 0x2094FA), // blue
    Color(hex: 0xFA0F4F), // pink
]

public func getUserColor(_ id: UserId) -> Color {
    userColors[abs(id) % 7]
}

private extension Color {
    init(hex: UInt) {
        self.init(
            red: Double(hex >> 16 & 0xFF) / 255,
            green: Double(hex >> 08 & 0xFF) / 255,
            blue: Double(hex >> 00 & 0xFF) / 255,
            opacity: 1.0
        )
    }
}
