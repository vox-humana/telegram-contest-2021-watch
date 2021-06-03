import SwiftUI

public struct ActivityIndicator: View {
    private let size: CGFloat

    public init(size: CGFloat = 30) {
        self.size = size
    }

    public var body: some View {
        SpinnerView(size: size) // ProgressView()
    }
}

struct SpinnerView: View {
    let size: CGFloat
    @State var isAnimating = false

    var body: some View {
        Circle()
            .trim(from: 0.25, to: 0.75)
            .stroke(
                Color.accentColor,
                style: StrokeStyle(
                    lineWidth: 5,
                    lineCap: .round
                )
            )
            .frame(width: size, height: size)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false)
            )
            .onAppear {
                self.isAnimating = true
            }
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        CompatibleScrollViewReader { _ in
            ActivityIndicator(size: 24)
                .padding()

            List {
                Text("one")
                Text("two")
            }
        }
        .accentColor(.blue)
        .environment(\.defaultMinListRowHeight, 10)
        .navigationBarTitle("Chat")
    }
}
