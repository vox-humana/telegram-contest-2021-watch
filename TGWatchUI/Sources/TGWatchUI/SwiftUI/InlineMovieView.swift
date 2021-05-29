import SwiftUI

struct InlineMovieView: WKInterfaceObjectRepresentable {
    var movieURL: URL

    func makeWKInterfaceObject(context _: Context) -> WKInterfaceInlineMovie {
        WKInterfaceInlineMovie()
    }

    func updateWKInterfaceObject(_ movie: WKInterfaceInlineMovie, context _: Context) {
        movie.setMovieURL(movieURL)
        movie.playFromBeginning()
    }
}
