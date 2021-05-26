import SwiftUI

public struct PhotoContentView: View {
    let photo: Photo

    public var body: some View {
        image
            .background(Color.gray)
            .cornerRadius(.tgMessageCornerRadius)
    }

    @ViewBuilder
    private var image: some View {
        // TODO: use photo.minithumbnail while loading
        LocalPhotoView(file: photo.file, placeholderName: "photo")
    }
}

struct PhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoContentView(photo: .photo)
            .accentColor(.blue)
    }
}

private extension Photo {
    var file: File? {
        // TODO: sort by size and choose the right one (or the first downloaded)
        sizes.first?.photo
    }
}
