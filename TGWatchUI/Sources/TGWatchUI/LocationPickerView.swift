import MapKit
import SwiftUI

struct LocationPickerView: View {
    @ObservedObject var locationManager: LocationManager = sharedLocationManager
    let completion: (CLLocationCoordinate2D) -> Void

    var body: some View {
        ScrollView {
            map
                .aspectRatio(4 / 3, contentMode: .fill)
            Button {
                if let location = coordinate {
                    completion(location)
                }
            } label: {
                Text("Current Location")
                    .font(.tgTitle)
            }
            .disabled(locationManager.location == nil)
        }
        .onAppear {
            locationManager.start()
        }
        .onDisappear {
            locationManager.stop()
        }
    }

    private var coordinate: CLLocationCoordinate2D? {
        locationManager.location?.coordinate
    }

    @ViewBuilder
    private var map: some View {
        if #available(watchOS 7.0, *) {
            MapView(location: coordinate)
                .cornerRadius(.tgMessageCornerRadius)
        } else {
            WKMapView(location: coordinate)
        }
    }
}

struct LocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreview {
            LocationPickerView(completion: { _ in })
        }
    }
}

let sharedLocationManager = LocationManager()

final class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func start() {
        print("📍start")
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func stop() {
        print("📍stop")
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didFailWithError error: Error) {
        print("📍", error)
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // The objects in the array are organized in the order in which they occurred. Therefore, the most recent location update is at the end of the array.
        guard let location = locations.last else { return }
        print("📍 got location")
        self.location = location
    }
}
