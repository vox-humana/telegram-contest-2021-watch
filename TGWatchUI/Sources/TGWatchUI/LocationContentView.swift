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
            MapView(location: state.location)
        } else {
            WKMapView(location: state.location)
        }
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
