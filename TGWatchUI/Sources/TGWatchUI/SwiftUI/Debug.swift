import SwiftUI

public extension View {
    func debugBorder() -> some View {
        border(Color.random, width: 1)
    }
}

private extension Color {
    static var random: Self {
        [
            Color.red,
            Color.green,
            Color.blue,
            Color.orange,
            Color.yellow,
            Color.pink,
            Color.purple,
        ]
        .randomElement()!
    }
}

public struct ConstructionView: View {
    public init() {}

    public var body: some View {
        Text("🚧 Under construction 🚧")
    }
}
