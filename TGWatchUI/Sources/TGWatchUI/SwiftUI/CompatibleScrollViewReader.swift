import SwiftUI

// watchOS6 doesn't have ScrollViewReader

public struct ScrollProxy {
    let proxy: Any?

    public func scrollTo<ID>(_ id: ID, anchor: UnitPoint? = nil) where ID: Hashable {
        if #available(watchOS 7.0, *) {
            (proxy as? ScrollViewProxy)?.scrollTo(id, anchor: anchor)
        }
    }
}

public struct CompatibleScrollViewReader<Content: View>: View {
    private let content: (ScrollProxy) -> Content

    public init(@ViewBuilder content: @escaping (ScrollProxy) -> Content) {
        self.content = content
    }

    public var body: some View {
        if #available(watchOSApplicationExtension 7.0, *) {
            ScrollViewReader { proxy in
                content(ScrollProxy(proxy: proxy))
            }
        } else {
            content(ScrollProxy(proxy: nil))
        }
    }
}
