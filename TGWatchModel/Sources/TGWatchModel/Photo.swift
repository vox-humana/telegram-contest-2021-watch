import Foundation

public struct Photo: Hashable {
    public var smallFile: File?
}

public typealias FileId = Int64

public struct File: Hashable {
    public let id: FileId
    public let path: String
    public let downloaded: Bool
    public let size: Int64
}

extension File: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("file")

        id = json.unwrap("id")
        size = json.unwrap("size")

        let local: JSON = json.unwrap("local")
        path = local.unwrap("path")

        let downloadedFlag: Int = local.unwrap("is_downloading_completed")
        downloaded = downloadedFlag == 1
    }
}
