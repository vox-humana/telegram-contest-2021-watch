import Combine
import SwiftUI

public protocol ImageLoadingTask {
    var image: AnyPublisher<Image?, Never> { get }
    // TODO: func load/cancel()
}

public protocol ImageLoader {
    func task(photo: ThumbnailState) -> ImageLoadingTask
    func player(sticker: StickerState) -> TGSPlayer
}

struct ImageLoaderEnvironment: EnvironmentKey {
    static var defaultValue: ImageLoader = DummyImageLoader(image: nil)
}

struct DummyImageLoadingTask: ImageLoadingTask {
    let initialImage: Image?

    var image: AnyPublisher<Image?, Never> {
        Just(initialImage).eraseToAnyPublisher()
    }
}

struct DummyImageLoader: ImageLoader {
    let image: Image?

    func task(photo _: ThumbnailState) -> ImageLoadingTask {
        DummyImageLoadingTask(initialImage: image)
    }

    func player(sticker _: StickerState) -> TGSPlayer {
        TGSPlayer(
            fileDownload: Just("") // TODO: pass preview
                .setFailureType(to: Error.self).eraseToAnyPublisher()
        )
    }
}

public extension EnvironmentValues {
    var imageLoader: ImageLoader {
        get { self[ImageLoaderEnvironment.self] }
        set { self[ImageLoaderEnvironment.self] = newValue }
    }
}

struct PhotoView: View {
    @State private var image: Image?
    private let task: ImageLoadingTask

    init(task: ImageLoadingTask) {
        self.task = task
    }

    var body: some View {
        ZStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        // TODO: cancel on disappear
        .onReceive(task.image) {
            self.image = $0
        }
    }
}
