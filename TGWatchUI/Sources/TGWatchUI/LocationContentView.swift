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

struct LocationContentView: View {
    private let state: LocationState
    private let fullView: Bool

    init(_ state: LocationState, fullView: Bool = false) {
        self.state = state
        self.fullView = fullView
    }

    var body: some View {
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
    static let preview = LocationState(location: .stPaul, isLive: false)
    static let live = LocationState(location: .stPaul, isLive: true)
}

extension CLLocationCoordinate2D {
    static let stPaul = CLLocationCoordinate2D(latitude: 51.5138, longitude: -0.0984)
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
