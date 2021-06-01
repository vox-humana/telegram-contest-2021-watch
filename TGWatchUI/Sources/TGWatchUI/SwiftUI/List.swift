import SwiftUI

struct ClearListStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listStyle(PlainListStyle())
    }
}

public extension View {
    func clearedListStyle() -> some View {
        modifier(ClearListStyle())
    }
}
