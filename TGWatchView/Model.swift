import MapKit
import TGWatchUI

extension AudioState {
    convenience init(_ message: MessageAudio) {
        self.init(
            caption: message.caption.text,
            duration: message.audio.duration,
            unplayed: false // TODO: ?
        )
    }
}

extension LocationState {
    init(_ message: MessageLocation) {
        self.init(
            location: CLLocationCoordinate2D(
                latitude: message.location.latitude,
                longitude: message.location.longitude
            ),
            isLive: message.livePeriod > 0
        )
    }
}
