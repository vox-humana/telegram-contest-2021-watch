import SwiftUI

struct InlineMovieView: WKInterfaceObjectRepresentable {
    let movieURL: URL

    func makeWKInterfaceObject(context _: Context) -> WKInterfaceInlineMovie {
        let movie = WKInterfaceInlineMovie()
        movie.setLoops(true)
        return movie
    }

    func updateWKInterfaceObject(_ movie: WKInterfaceInlineMovie, context _: Context) {
        movie.setMovieURL(movieURL)
        movie.setVideoGravity(.resizeAspectFill)
        movie.playFromBeginning()
    }
}

struct InlineMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle().fill(Color.green)
            InlineMovieView(movieURL: URL(fileURLWithPath: .previewFilePath("video.mp4")))
                .debugBorder()
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}
