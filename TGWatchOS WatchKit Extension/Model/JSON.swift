import Foundation

typealias JSON = [String: Any]

extension JSON {
    func unwrap(_ key: String) -> String {
        unwrap(key, empty: "")
    }

    func unwrap(_ key: String) -> Int {
        unwrap(key, empty: 13)
    }

    func unwrap(_ key: String) -> Int64 {
        unwrap(key, empty: 13)
    }

    func unwrap(_ key: String) -> JSON {
        unwrap(key, empty: [:])
    }

    func unwrap<T>(_ key: String) -> [T] {
        unwrap(key, empty: [])
    }

    private func unwrap<T>(_ key: String, empty: T) -> T {
        let value = self[key] as? T
        assert(value != nil, "Cannot unwrap key: \(key)")
        return value ?? empty
    }
}

extension JSON {
    func checkType(_ type: String) {
        assert(self["@type"] as? String == type)
    }
}

protocol JSONDecodable {
    init(json: JSON)
}

extension JSONDecodable {
    init(json: Any) {
        self.init(json: json as! JSON)
    }
}
