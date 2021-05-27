import MapKit
import SwiftUI

public struct LocationState {
    public init(location: CLLocationCoordinate2D, isLive: Bool) {
        self.location = location
        self.isLive = isLive
    }

    let location: CLLocationCoordinate2D
    let isLive: Bool
}

public struct LocationContentView: View {
    let state: LocationState
    
    public init(state: LocationState) {
        self.state = state
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            map
            if state.isLive {
                Text("Live Location")
                    .padding(.tgTextPadding)
            }
        }
        .frame(width: 160, height: 120)
    }

    @ViewBuilder
    private var map: some View {
        if #available(watchOS 7.0, *) {
            Map(
                coordinateRegion: .constant(
                    MKCoordinateRegion(
                        center: .init(latitude: state.location.latitude, longitude: state.location.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    )
                ),
                annotationItems: [state]
            ) { location in
                MapAnnotation(coordinate: location.location, anchorPoint: CGPoint(x: 0.5, y: 1.0)) {
                    Image("Pin")
                }
            }
        } else {
            Text("📍 \(state.location.latitude), \(state.location.longitude)")
        }
    }
}

extension LocationState: Identifiable {
    public var id: String {
        "\(location.latitude):\(location.longitude):\(isLive)"
    }
}

extension LocationState {
    static let preview = LocationState(location: .init(latitude: 60, longitude: 30), isLive: false)
    static let live = LocationState(location: .init(latitude: 60, longitude: 30), isLive: true)
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LocationContentView(state: .preview)
            LocationContentView(state: .live)
        }
        .accentColor(.blue)
        .background(Color.white)
    }
}
