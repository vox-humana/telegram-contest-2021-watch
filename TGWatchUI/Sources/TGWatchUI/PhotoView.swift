import Combine
import SwiftUI

public protocol ImageLoadingTask {
    var image: AnyPublisher<Image?, Never> { get }
    // TODO: func load/cancel()
}

public protocol ImageLoader {
    func task(photo: ThumbnailState) -> ImageLoadingTask
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
        // image = task.image
    }

    var body: some View {
        ZStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .background(Color.tgGrey)
        // TODO: cancel on disappear
        .onReceive(task.image) {
            self.image = $0
        }
    }
}
