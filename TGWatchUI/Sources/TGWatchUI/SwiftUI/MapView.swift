import MapKit
import SwiftUI

struct WKMapView: WKInterfaceObjectRepresentable {
    let location: CLLocationCoordinate2D?

    func makeWKInterfaceObject(context _: Context) -> WKInterfaceMap {
        // WKInterfaceMap has corner radius :facepalm:
        let map = WKInterfaceMap()
        if let location = location {
            map.setVisibleMapRect(MKMapRect(center: location))
        }
        return map
    }

    func updateWKInterfaceObject(_ map: WKInterfaceMap, context _: Context) {
        map.removeAllAnnotations()
        if let location = location {
            let uiImage = UIImage(named: "Pin", in: .module, with: nil)
            map.addAnnotation(location, with: uiImage, centerOffset: CGPoint(x: 0, y: -25))
        }
    }
}

// Seems like it has leaks in annotations :notsureif:
@available(watchOS 7.0, *)
struct MapView: View {
    let location: CLLocationCoordinate2D?

    var body: some View {
        if let location = location {
            Map(
                mapRect: .constant(MKMapRect(center: location)),
                interactionModes: MapInteractionModes(rawValue: 0),
                annotationItems: [location]
            ) { location in
                MapAnnotation(coordinate: location, anchorPoint: CGPoint(x: 0.5, y: 0.85)) {
                    Image("Pin", bundle: .module)
                }
            }
        } else {
            Map(
                mapRect: .constant(MKMapRect(center: .stPaul)),
                interactionModes: MapInteractionModes(rawValue: 0)
            )
        }
    }
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: Double {
        latitude + 100 * longitude
    }
}

private extension MKMapRect {
    init(center location: CLLocationCoordinate2D) {
        let scale = MKMapPointsPerMeterAtLatitude(location.latitude)
        let center = MKMapPoint(location)
        let offset = scale * 80
        let width = scale * 500
        let height = scale * 500
        self.init(
            x: center.x - width / 2,
            y: center.y - height / 2 - offset,
            width: width,
            height: height
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            if #available(watchOS 7.0, *) {
                MapView(location: LocationState.preview.location)
                    .aspectRatio(4 / 3, contentMode: .fit)
                    .tgMessageStyle(isOutgoing: false)
            }
            WKMapView(location: LocationState.preview.location)
                .aspectRatio(4 / 3, contentMode: .fit)
                .tgMessageStyle(isOutgoing: false)
        }
    }
}
