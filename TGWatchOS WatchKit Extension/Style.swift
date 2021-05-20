import SwiftUI

struct AccentStyle: ButtonStyle {
    // watchOS7+
    // private let color = Color.accentColor // doesn't work on watchOS 6
    private let color = Color("AccentColor") // doesn't work on watchOS 6

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .font(.tgTitle)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.accentColor)
            )
    }
}

struct AccentStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("New Message") {}
            .buttonStyle(AccentStyle())
    }
}

extension Font {
    static let tgTitle = Font.system(size: 17)
    static let tgChatTitle = tgTitle.weight(.medium)
    static let tgBadgeCount = Font.system(size: 14)
}
