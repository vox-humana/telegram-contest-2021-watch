public struct User {
    public let id: Int
    public let photo: ChatIcon
    public let name: String
    public let phone: String
}

extension User: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("user")

        id = json.unwrap("id")
        name = json.unwrap("first_name")

        let profileJSON: JSON = json.unwrap("profile_photo")
        let smallFile = File(json: profileJSON.unwrap("small"))
        photo = ChatIcon(smallFile: smallFile)

        phone = json.unwrap("phone_number")
    }
}
