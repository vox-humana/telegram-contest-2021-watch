import Foundation

struct Photo: Hashable {
    var smallFile: File?
}

typealias FileId = Int64

struct File: Hashable {
    let id: FileId
    let path: String
    let downloaded: Bool
    let size: Int64
}

extension File: JSONDecodable {
    init(json: [String: Any]) {
        json.checkType("file")
        
        id = json.unwrap("id")
        size = json.unwrap("size")
        
        let local: JSON = json.unwrap("local")
        path = local.unwrap("path")
        
        let downloadedFlag: Int = local.unwrap("is_downloading_completed")
        downloaded = downloadedFlag == 1
    }
}
