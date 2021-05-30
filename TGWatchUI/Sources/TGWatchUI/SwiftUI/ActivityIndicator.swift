import SwiftUI

// TODO: custom activity
public struct ActivityIndicator: View {
    public init() {}

    public var body: some View {
        if #available(watchOS 7.0, *) {
            ProgressView()
        } else {
            Text("loading...")
        }
    }
}
