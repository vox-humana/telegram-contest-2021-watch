import Foundation

public struct Logger {
    public func debug(
        _ closure: @autoclosure () -> Any?,
        filename: StaticString = #fileID, line: UInt = #line, function: StaticString = #function
    ) {
        #if DEBUG
            print("⌚️\(filename):\(line):\(function)", closure() ?? "")
        #endif
    }

    public func assert(
        _ message: @autoclosure () -> String = "",
        filename: StaticString = #fileID, line: UInt = #line, function _: StaticString = #function
    ) {
        #if DEBUG
            assertionFailure(message(), file: filename, line: line)
        #endif
    }
}

public let logger = Logger()
