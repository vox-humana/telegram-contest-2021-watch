import Combine
import Gzip
import SDWebImageLottieCoder
import SwiftUI

struct TGSStickerView: View {
    @ObservedObject var player: TGSPlayer

    var body: some View {
        ZStack {
            player.image.map(Image.init(uiImage:))
        }
        .onAppear(perform: player.startAnimating)
        .onDisappear(perform: player.stopAnimating)
    }
}

public final class TGSPlayer: ObservableObject {
    @Published var image: UIImage?
    var isAnimating: Bool {
        timer != nil
    }

    private var coder: SDImageLottieCoder?
    private var timer: Timer?
    private let tick: TimeInterval = 0.02
    private var frameIndex: UInt = 0
    private var subscription: AnyCancellable?

    public init(fileDownload: AnyPublisher<String, Swift.Error>) {
        subscription = fileDownload
            .receive(on: DispatchQueue.global())
            .map { (path: String) -> SDImageLottieCoder? in
                let fileURL = URL(fileURLWithPath: path)
                guard
                    let data = try? Data(contentsOf: fileURL),
                    let unzipped = try? data.gunzipped()
                else {
                    assertionFailure("Can't unzip animated data")
                    return nil
                }
                let size = CGSize(width: .tgStickerWidth * 2, height: .tgStickerWidth * 2)
                return SDImageLottieCoder(
                    animatedImageData: unzipped,
                    options: [SDImageCoderOption.decodeThumbnailPixelSize: size]
                )
            }
            .receive(on: DispatchQueue.main)
            .sink { result in
                print(result)
            } receiveValue: { [weak self] coder in
                self?.coder = coder
            }
    }

    func startAnimating() {
        guard timer == nil else {
            return
        }

        renderFrame()

        timer = Timer.scheduledTimer(withTimeInterval: tick, repeats: true) { [weak self] _ in
            self?.renderFrame()
        }
    }

    func stopAnimating() {
        // TODO: or reset?
        timer?.invalidate()
        timer = nil
        image = nil
    }

    private func renderFrame() {
        guard let coder = coder else {
            return
        }

        guard let cgImage = coder.animatedImageFrame(at: frameIndex)?.cgImage else {
            return
        }

        image = UIImage(cgImage: cgImage, scale: 2.0, orientation: .up)
        frameIndex = (frameIndex + 1) % coder.animatedImageFrameCount
    }
}
