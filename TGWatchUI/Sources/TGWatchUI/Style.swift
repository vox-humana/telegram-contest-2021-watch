import SwiftUI

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
}

struct TGMessage: ViewModifier {
    let isOutgoing: Bool
    let hideBackground: Bool

    func body(content: Content) -> some View {
        if !hideBackground {
            content
                .foregroundColor(isOutgoing ? Color.white : Color.tgBlack)
                .background(isOutgoing ? Color.accentColor : Color.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: .tgMessageCornerRadius, style: .circular)
                )
        } else {
            content
                .clipShape(
                    RoundedRectangle(cornerRadius: .tgMessageCornerRadius, style: .circular)
                )
        }
    }
}

public extension View {
    func tgMessageStyle(isOutgoing: Bool, hideBackground: Bool = false) -> some View {
        modifier(TGMessage(isOutgoing: isOutgoing, hideBackground: hideBackground))
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
