import SwiftUI

public struct UnreadIndicator: View {
    public init() {}

    public var body: some View {
        Circle()
            .frame(width: 6, height: 6, alignment: .center)
            .foregroundColor(.accentColor)
    }
}
