import SwiftUI

extension View {
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
            Color.pink,
            Color.purple,
        ]
        .randomElement()!
    }
}

struct ConstructionView: View {
    var body: some View {
        Text("🚧 Under construction 🚧")
    }
}
