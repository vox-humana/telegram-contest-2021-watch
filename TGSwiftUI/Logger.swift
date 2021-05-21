import Foundation

public struct Logger {
    public func debug(
        _ closure: @autoclosure () -> Any?,
        filename: StaticString = #fileID, line: Int = #line, function: StaticString = #function
    ) {
        #if DEBUG
            print("⌚️\(filename):\(line):\(function)", closure() ?? "")
        #endif
    }
}

public let logger = Logger()
