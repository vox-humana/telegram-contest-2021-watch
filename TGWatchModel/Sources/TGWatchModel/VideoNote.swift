public struct VideoNote: Hashable {
    public let duration: Int
    public let length: Int
    public let thumbnail: Thumbnail
    public let video: File
}

extension VideoNote: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("videoNote")
        duration = json.unwrap("duration")
        length = json.unwrap("length")

        video = File(json: json.unwrap("video"))
        thumbnail = Thumbnail(json: json.unwrap("thumbnail"))
    }
}

public struct Thumbnail: Hashable {
    public enum Format: String {
        case thumbnailFormatJpeg
        case unknown
    }

    public let format: Format
    public let width: Int
    public let height: Int
    public let file: File
}

extension Thumbnail: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("thumbnail")
        width = json.unwrap("width")
        height = json.unwrap("height")
        format = Format(json: json.unwrap("format"))
        file = File(json: json.unwrap("file"))
    }
}

extension Thumbnail.Format: JSONDecodable {
    public init(json: [String: Any]) {
        let rawFormat: String = json.unwrap("@type")
        self = .init(rawValue: rawFormat) ?? .unknown
        assert(self != .unknown, "Unknown type \(rawFormat)")
    }
}
