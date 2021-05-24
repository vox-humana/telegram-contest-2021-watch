import Foundation

public typealias JSON = [String: Any]

public extension JSON {
    func unwrap(_ key: String) -> String {
        unwrap(key, empty: "")
    }

    func unwrap(_ key: String) -> Int {
        unwrap(key, empty: 13)
    }

    func unwrap(_ key: String) -> Int64 {
        unwrap(key, empty: 13)
    }

    func unwrap(_ key: String) -> Double {
        unwrap(key, empty: 30)
    }

    func unwrap(_ key: String) -> Bool {
        unwrap(key, empty: false)
    }

    func unwrap(_ key: String) -> JSON {
        unwrap(key, empty: [:])
    }

    func unwrap<T>(_ key: String) -> [T] {
        unwrap(key, empty: [])
    }

    func unwrapArray<T: JSONDecodable>(_ key: String) -> [T] {
        let array: [JSON] = unwrap(key)
        return array.map(T.init(json:))
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

public protocol JSONDecodable {
    init(json: JSON)
}

public extension JSONDecodable {
    init(json: Any) {
        self.init(json: json as! JSON)
    }
}
