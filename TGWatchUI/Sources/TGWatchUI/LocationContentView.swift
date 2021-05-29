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
    private let state: LocationState
    private let fullView: Bool

    public init(_ state: LocationState, fullView: Bool = false) {
        self.state = state
        self.fullView = fullView
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            map.aspectRatio(4 / 3, contentMode: .fit)

            if state.isLive {
                Text("Live Location")
                    .padding(.tgTextPadding)
            }
        }
    }

    @ViewBuilder
    private var map: some View {
        if #available(watchOS 7.0, *) {
            Map(
                mapRect: .constant(mapRect),
                interactionModes: MapInteractionModes(rawValue: 0),
                annotationItems: [state]
            ) { location in
                MapAnnotation(coordinate: location.location, anchorPoint: CGPoint(x: 0.5, y: 0.85)) {
                    Image("Pin", bundle: .module)
                }
            }
        } else {
            Text("📍 \(state.location.latitude), \(state.location.longitude)")
        }
    }

    private var mapRect: MKMapRect {
        let scale = MKMapPointsPerMeterAtLatitude(state.location.latitude)
        let center = MKMapPoint(state.location)
        let offset = scale * 80
        let width = scale * 500
        let height = scale * 500
        return MKMapRect(x: center.x - width / 2, y: center.y - height / 2 - offset, width: width, height: height)
    }
}

extension LocationState: Identifiable {
    public var id: String {
        "\(location.latitude):\(location.longitude):\(isLive)"
    }
}

extension LocationState {
    static let preview = LocationState(location: .init(latitude: -33.848792, longitude: 151.206011), isLive: false)
    static let live = LocationState(location: .init(latitude: -33.848792, longitude: 151.206011), isLive: true)
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LocationContentView(.preview)
            LocationContentView(.live)
                .frame(width: .tgMessageWidth)
        }
        .tgMessageStyle(isOutgoing: false)
        .accentColor(.blue)
    }
}
