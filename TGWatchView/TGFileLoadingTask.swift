import Combine
import SDWebImageWebPCoder
import SwiftUI
import TGWatchUI

final class TGFileLoadingTask: FileLoadingTask {
    private let pathSubject = CurrentValueSubject<String?, Never>(nil)
    private let chatService: ChatService
    private let fileState: LocalFileState
    private var subscription: AnyCancellable?

    var file: AnyPublisher<String?, Never> { pathSubject.eraseToAnyPublisher() }

    init(_ chatService: ChatService, file: LocalFileState) {
        self.chatService = chatService
        fileState = file

        if file.downloaded {
            pathSubject.send(file.path)
            subscription = nil
        } else {
            subscription = chatService
                .download(file: file.fileId)
                .receive(on: DispatchQueue.main)
                .sink { result in
                    logger.debug(result)
                } receiveValue: { [weak self] path in
                    self?.pathSubject.send(path)
                }
        }
    }
}
