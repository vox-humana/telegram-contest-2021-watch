import Combine
import SDWebImageWebPCoder
import SwiftUI
import TGWatchUI

final class TGImageLoadingTask: ImageLoadingTask {
    private let imageSubject = CurrentValueSubject<Image?, Never>(nil)
    private let chatService: ChatService
    private let photo: ThumbnailState
    private var subscription: AnyCancellable?

    init(_ chatService: ChatService, photo: ThumbnailState) {
        self.chatService = chatService
        self.photo = photo
        subscription = load(photo: photo).sink { [weak self] in
            self?.imageSubject.send($0)
        }
    }

    var image: AnyPublisher<Image?, Never> { imageSubject.eraseToAnyPublisher() }

    private func load(photo: ThumbnailState) -> AnyPublisher<Image?, Never> {
        if let thumbnail = photo.thumbnail, thumbnail.file.downloaded {
            return Self.image(from: thumbnail.file.path, format: thumbnail.format)
        }

        let miniThumbnail = Self.thumbnail(for: photo.minithumbnail?.data)

        if let thumbnail = photo.thumbnail {
            return
                chatService.download(file: thumbnail.file.fileId)
                    // TODO: .retry(3)
                    .catch { (error: Swift.Error) -> AnyPublisher<String, Never> in
                        logger.assert(error.localizedDescription)
                        return Just("").eraseToAnyPublisher()
                    }
                    .flatMap { (path: String) -> AnyPublisher<Image?, Never> in
                        Self.image(from: path, format: thumbnail.format)
                    }
                    .prepend(
                        miniThumbnail
                    )
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
        } else {
            return miniThumbnail
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }

    private static func thumbnail(for data: Data?) -> AnyPublisher<Image?, Never> {
        guard let data = data else {
            return Just(nil).eraseToAnyPublisher()
        }
        return Deferred {
            Just(Image.image(from: data))
        }
        .subscribe(on: DispatchQueue.global())
        .eraseToAnyPublisher()
    }

    private func image(
        for fileId: FileId, format: ThumbnailState.Thumbnail.Format
    ) -> AnyPublisher<Image?, Never> {
        chatService.download(file: fileId)
            .catch { (error: Swift.Error) -> AnyPublisher<String, Never> in
                logger.assert(error.localizedDescription)
                return Just("").eraseToAnyPublisher()
            }
            .flatMap { (path: String) -> AnyPublisher<Image?, Never> in
                Self.image(from: path, format: format)
            }
            .eraseToAnyPublisher()
    }

    private static func image(
        from path: String, format: ThumbnailState.Thumbnail.Format
    ) -> AnyPublisher<Image?, Never> {
        Deferred {
            Just(Image.image(from: path, format: format))
        }
        .subscribe(on: DispatchQueue.global())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

private extension Image {
    static func image(from path: String, format: ThumbnailState.Thumbnail.Format) -> Image? {
        switch format {
        case .jpg,
             .png,
             .gif: // TODO: check GIF
            return UIImage.image(contentOf: path, decoding: { UIImage(data: $0) })
                .map(Image.init(uiImage:))

        case .webp:
            return UIImage
                .image(
                    contentOf: path,
                    // TODO: extract decoding and remove SDWebImage dependency
                    // https://github.com/TelegramMessenger/Telegram-iOS/blob/6442f7925f96f4e40c0b18661877c9e141c4fd53/submodules/WebPBinding/Sources/UIImage%2BWebP.m
                    decoding: { SDImageWebPCoder.shared.decodedImage(with: $0, options: nil) }
                )
                .map(Image.init(uiImage:))
        case .tgs:
            assertionFailure("unsupported")
            return nil
        case .mpeg4:
            assertionFailure("unsupported")
            return nil
        }
    }

    static func image(from data: Data) -> Image? {
        guard let uiImage = UIImage(data: data) else {
            assertionFailure("Can't create image from thumbnail data")
            return nil
        }
        return Image(uiImage: uiImage)
    }
}

private extension UIImage {
    static func image(contentOf path: String, decoding: (Data) -> UIImage?) -> UIImage? {
        let fileURL = URL(fileURLWithPath: path)
        guard
            let data = try? Data(contentsOf: fileURL),
            let uiImage = decoding(data)
        else {
            assertionFailure("Can't read image from: \(path)")
            return nil
        }
        return uiImage
    }
}
