/*
 "content": {
   "@type": "messageLocation",
   "location": {
     "@type": "location",
     "latitude": -33.827755,
     "longitude": 151.200975,
     "horizontal_accuracy": 10.000000
   },
   "live_period": 900,
   "expires_in": 0,
   "heading": 0,
   "proximity_alert_radius": 0
 }
 */
public struct Location: Hashable {
    public let latitude: Double
    public let longitude: Double
}

extension Location: JSONDecodable {
    public init(json: JSON) {
        json.checkType("location")
        latitude = json.unwrap("latitude")
        longitude = json.unwrap("longitude")
    }
}
