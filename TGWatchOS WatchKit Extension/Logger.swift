import Foundation

struct Logger {
    func debug(
        _ closure: @autoclosure () -> Any?,
        filename: StaticString = #filePath, line: Int = #line, function: StaticString = #function
    ) {
        print("⌚️\(filename):\(line):\(function)", closure() ?? "")
    }
}

let logger = Logger()
