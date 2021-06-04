import SwiftUI

struct DevicePreview<Content: View>: View {
    private let preiviewDevices: [PreviewDevice] = [
        "Apple Watch Series 6 - 44mm",
        "Apple Watch Series 3 - 38mm",
    ]

    let content: () -> Content

    init(_ content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ForEach(preiviewDevices, id: \.rawValue) { device in
            content()
                .previewDevice(device)
        }
        .accentColor(.blue)
    }
}
