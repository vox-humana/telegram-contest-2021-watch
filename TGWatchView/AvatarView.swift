import SwiftUI

import UIKit

protocol AvatarPhoto {
    var small: File { get }
    var minithumbnail: Minithumbnail? { get }
}

extension ChatPhotoInfo: AvatarPhoto {}
extension ProfilePhoto: AvatarPhoto {}

struct AvatarView: View {
    let photo: AvatarPhoto?
    private let size: CGFloat = 24

    var body: some View {
        LocalPhotoView(file: photo?.small)
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
    }
}

struct LocalPhotoView: View {
    let placeholderName: String

    private class LocalLoader: ObservableObject {
        var image: Image?

        init(file: File?) {
            guard let file = file, file.local.isDownloadingCompleted else {
                return
            }

            let fileURL = URL(fileURLWithPath: file.local.path)

            // background?
            guard
                let data = try? Data(contentsOf: fileURL),
                let uiImage = UIImage(data: data)
            else {
                assertionFailure("Can't read image from: \(file.local.path)")
                return
            }

            image = Image(uiImage: uiImage)
            objectWillChange.send()
        }
    }

    @ObservedObject private var loader: LocalLoader

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    init(file: File?, placeholderName: String = "person") {
        _loader = ObservedObject(wrappedValue: LocalLoader(file: file))
        self.placeholderName = placeholderName
    }

    private var image: Image {
        if let image = loader.image {
            return image
        } else {
            return Image(systemName: placeholderName)
        }
    }
}
