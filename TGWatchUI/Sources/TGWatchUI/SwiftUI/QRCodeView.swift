import swift_qrcodejs
import SwiftUI

struct QRCodeShape: Shape {
    private let insetsRatio: CGFloat = 0
    private let cornerSize = 7 // borders size from swift_qrcodejs

    private let string: String
    private let imageSide: CGFloat

    init(_ string: String, imageSide: CGFloat = 0) {
        self.string = string
        self.imageSide = imageSide
    }

    func path(in rect: CGRect) -> Path {
        // TODO: re-implement and remove external lib
        var codes = QRCode(string, errorCorrectLevel: .H, withBorder: false)!.imageCodes
        let side = codes.count

        let padding = rect.width * insetsRatio
        let dx = (rect.width - 2 * padding) / CGFloat(side)
        let dy = (rect.height - 2 * padding) / CGFloat(side)

        let codeToScreen = { (x: Int, y: Int) -> CGPoint in
            .init(x: padding + dx * CGFloat(x), y: padding + dy * CGFloat(y))
        }

        for (y, row) in codes.enumerated() {
            for (x, filled) in row.enumerated() {
                guard filled else {
                    continue
                }

                // Cleanup corners from swift_qrcodejs
                if x < cornerSize, y < cornerSize {
                    codes[y][x] = false
                    continue
                }

                if x >= (side - cornerSize), y < cornerSize {
                    codes[y][x] = false
                    continue
                }

                if x < cornerSize, y >= (side - cornerSize) {
                    codes[y][x] = false
                    continue
                }

                // Cleanup center
                guard imageSide > 0 else {
                    continue
                }

                let pt = codeToScreen(x, y)
                let mid = codeToScreen(side / 2, side / 2)
                let t = pt.applying(.init(translationX: -mid.x, y: -mid.y))
                let radius = CGFloat(2) * imageSide * imageSide
                if (t.x * t.x + t.y * t.y) < radius {
                    codes[y][x] = false
                    continue
                }
            }
        }

        var path = Path()

        // Draw rounded lines
        for (y, row) in codes.enumerated() {
            for (x, filled) in row.enumerated() {
                guard filled else {
                    continue
                }

                var corners: UIRectCorner = []
                if x == 0 || !codes[y][x - 1], y == 0 || !codes[y - 1][x] {
                    corners.insert(.topLeft)
                }
                if x == side - 1 || !codes[y][x + 1], y == 0 || !codes[y - 1][x] {
                    corners.insert(.topRight)
                }
                if x == 0 || !codes[y][x - 1], y == side - 1 || !codes[y + 1][x] {
                    corners.insert(.bottomLeft)
                }
                if x == side - 1 || !codes[y][x + 1], y == side - 1 || !codes[y + 1][x] {
                    corners.insert(.bottomRight)
                }

                let pt = codeToScreen(x, y)
                let radiusRatio: CGFloat = 3.2
                let cornerRadius = CGSize(width: dx / radiusRatio, height: dy / radiusRatio)
                let rect = CGRect(origin: pt, size: .init(width: dx, height: dy))
                path.addPath(
                    Path(
                        UIBezierPath(
                            roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerRadius
                        )
                        .cgPath
                    )
                )
            }
        }

        // Draw corners
        let radiusRatio: CGFloat = 3.5
        let size = CGSize(
            width: dx * CGFloat(cornerSize),
            height: dy * CGFloat(cornerSize)
        )

        let cutSize = CGSize(
            width: dx * CGFloat(cornerSize - 2),
            height: dy * CGFloat(cornerSize - 2)
        )

        let innerSize = CGSize(
            width: dx * CGFloat(cornerSize - 4),
            height: dy * CGFloat(cornerSize - 4)
        )

        let drawCorner = { (origin: CGPoint, corners: UIRectCorner) in
            let outer = UIBezierPath(
                roundedRect: .init(
                    origin: origin,
                    size: size
                ),
                byRoundingCorners: corners,
                cornerRadii: CGSize(
                    width: size.width / radiusRatio,
                    height: size.height / radiusRatio
                )
            )

            let cut = UIBezierPath(
                roundedRect: .init(
                    origin: .init(x: origin.x + dx, y: origin.y + dy),
                    size: cutSize
                ),
                byRoundingCorners: corners,
                cornerRadii: CGSize(
                    width: cutSize.width / radiusRatio,
                    height: cutSize.height / radiusRatio
                )
            )

            let inner = UIBezierPath(
                roundedRect: .init(
                    origin: .init(x: origin.x + 2 * dx, y: origin.y + 2 * dy),
                    size: innerSize
                ),
                byRoundingCorners: corners,
                cornerRadii: CGSize(
                    width: innerSize.width / radiusRatio,
                    height: innerSize.height / radiusRatio
                )
            )

            path.addPath(Path(outer.cgPath))
            path.addPath(Path(cut.reversing().cgPath))
            path.addPath(Path(inner.cgPath))
        }

        drawCorner(
            .init(x: padding, y: padding),
            [.topLeft, .topRight, .bottomLeft]
        )

        drawCorner(
            .init(x: rect.maxX - padding - size.width, y: padding),
            [.topLeft, .topRight, .bottomRight]
        )

        drawCorner(
            .init(x: padding, y: rect.maxY - padding - size.height),
            [.topLeft, .bottomLeft, .bottomRight]
        )

        return path
    }
}

struct QRCodeView: View {
    private let string: String
    private let image: UIImage?
    private let imageSize: CGFloat

    init(_ string: String, image: UIImage? = nil) {
        self.string = string
        self.image = image
        if let image = image {
            imageSize = image.size.maxSide / image.scale
        } else {
            imageSize = 0
        }
    }

    var body: some View {
        ZStack(alignment: .center) {
            if let image = image {
                Image(uiImage: image)
            }
            QRCodeShape(string, imageSide: imageSize)
                .fill(Color.tgBlack)
        }
    }
}

extension CGSize {
    var maxSide: CGFloat {
        max(width, height)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView("https://telegram.org")
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: 160, height: 160)

        QRCodeView(
            "https://telegram.org/login?some_very_long_login_token===",
            image: UIImage(named: "qr-logo", in: .module, with: nil)
        )
        .padding(11)
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: 184, height: 184)
    }
}
