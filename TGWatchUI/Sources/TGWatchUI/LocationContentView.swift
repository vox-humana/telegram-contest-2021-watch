import MapKit
import SwiftUI
import TGWatchModel

struct LocationContentView: View {
    let location: Location

    var body: some View {
        map
            .frame(width: 160, height: 120)
            .cornerRadius(.tgMessageCornerRadius)
    }

    @ViewBuilder
    private var map: some View {
        if #available(watchOS 7.0, *) {
            Map(
                coordinateRegion: .constant(
                    MKCoordinateRegion(
                        center: .init(latitude: location.latitude, longitude: location.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    )
                )
            )
        } else {
            Text("Location: \(location.latitude), \(location.longitude)")
        }
    }
}
