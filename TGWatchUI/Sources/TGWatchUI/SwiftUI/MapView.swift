import SwiftUI

// TODO: use for watchOS 6
struct MapView: WKInterfaceObjectRepresentable {
    let location: CLLocationCoordinate2D

    func makeWKInterfaceObject(context _: Context) -> WKInterfaceMap {
        WKInterfaceMap()
    }

    func updateWKInterfaceObject(_: WKInterfaceMap, context _: Context) {
        // TODO: setup
    }
}
