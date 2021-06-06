import SwiftUI

public struct UnreadIndicator: View {
    public init() {}

    public var body: some View {
        Circle()
            .frame(width: 6, height: 6, alignment: .center)
        // .foregroundColor(.accentColor)
    }
}

public struct UnreadBadge: View {
    private let count: Int
    private let muted: Bool

    public init(_ count: Int, muted: Bool = false) {
        self.count = count
        self.muted = muted
    }

    public var body: some View {
        Text("\(count)")
            .font(.tgBadgeCount)
            .padding(.horizontal, 5)
            .padding(.vertical, 1)
            .background(
                Capsule(style: .circular)
                    .foregroundColor(muted ? .tgGrey : .compatibleAccentColor)
            )
    }
}

struct UnreadBadge_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .trailing) {
            UnreadBadge(99)
            UnreadBadge(6)
            UnreadBadge(25, muted: true)
        }
        .accentColor(.blue)
    }
}
