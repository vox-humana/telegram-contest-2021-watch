import Foundation

public struct Logger {
    public func debug(
        _ closure: @autoclosure () -> Any?,
        filename: StaticString = #fileID, line: Int = #line, function: StaticString = #function
    ) {
        print("⌚️\(filename):\(line):\(function)", closure() ?? "")
    }
}

public let logger = Logger()
