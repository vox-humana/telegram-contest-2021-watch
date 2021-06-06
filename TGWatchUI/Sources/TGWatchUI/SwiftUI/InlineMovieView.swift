import SwiftUI

struct InlineMovieView: WKInterfaceObjectRepresentable {
    let movieURL: URL

    func makeWKInterfaceObject(context _: Context) -> WKInterfaceInlineMovie {
        let movie = WKInterfaceInlineMovie()
        movie.setMovieURL(movieURL)
        movie.playFromBeginning()
        return movie
    }

    func updateWKInterfaceObject(_: WKInterfaceInlineMovie, context _: Context) {}
}
