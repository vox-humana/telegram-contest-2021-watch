import Combine
import SwiftUI

public protocol ImageLoadingTask {
    var image: AnyPublisher<Image?, Never> { get }
    // TODO: func load/cancel()
}

public protocol FileLoadingTask {
    var file: AnyPublisher<String?, Never> { get }
    // TODO: func load/cancel()
}

public protocol ImageLoader {
    func task(photo: ThumbnailState) -> ImageLoadingTask
    func player(sticker: StickerState) -> TGSPlayer
    func fileTask(file: LocalFileState) -> FileLoadingTask
}

struct ImageLoaderEnvironment: EnvironmentKey {
    static var defaultValue: ImageLoader = DummyImageLoader(image: nil, filePath: nil)
}

struct DummyImageLoadingTask: ImageLoadingTask {
    let initialImage: Image?

    var image: AnyPublisher<Image?, Never> {
        Just(initialImage).eraseToAnyPublisher()
    }
}

struct DummyFileLoadingTask: FileLoadingTask {
    let initialPath: String?

    var file: AnyPublisher<String?, Never> {
        Just(initialPath).eraseToAnyPublisher()
    }
}

struct DummyImageLoader: ImageLoader {
    let image: Image?
    let filePath: String?

    func task(photo _: ThumbnailState) -> ImageLoadingTask {
        DummyImageLoadingTask(initialImage: image)
    }

    func player(sticker _: StickerState) -> TGSPlayer {
        TGSPlayer(
            fileDownload: Just("") // TODO: pass preview
                .setFailureType(to: Error.self).eraseToAnyPublisher()
        )
    }

    func fileTask(file _: LocalFileState) -> FileLoadingTask {
        DummyFileLoadingTask(initialPath: filePath)
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
        .onReceive(task.image) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
