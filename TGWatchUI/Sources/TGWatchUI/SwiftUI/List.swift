import SwiftUI

struct ClearListStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
    }
}

public extension View {
    func clearedListStyle() -> some View {
        modifier(ClearListStyle())
    }
}

struct FlippedUpsideDown: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}

extension View {
    func flippedUpsideDown() -> some View {
        modifier(FlippedUpsideDown())
    }
}
