import SwiftUI

public struct ActivityIndicator: View {
    public init() {}

    public var body: some View {
        SpinnerView() // ProgressView()
    }
}

struct SpinnerConfiguration {
    var spinnerColor: Color = .white
    var blurredBackground: Color = .black
    var spinnerBackgroundColor: Color = .gray
    var backgroundCornerRadius: CGFloat = 30
    var width: CGFloat = 50
    var height: CGFloat = 50
    var speed: Double = 1
}

struct SpinnerView: View {
    var configuration = SpinnerConfiguration()
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
            .frame(width: 44, height: 44)
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
