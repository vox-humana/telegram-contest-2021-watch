import SwiftUI

public struct ActivityIndicator: View {
    public init() {}

    public var body: some View {
        SpinnerView() // ProgressView()
    }
}

struct SpinnerView: View {
    private let size: CGFloat = 30
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
        ActivityIndicator()
            .accentColor(.blue)
    }
}
