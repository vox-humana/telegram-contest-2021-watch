// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TGWatchUI",
    platforms: [
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "TGWatchUI",
            targets: ["TGWatchUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ApolloZhu/swift_qrcodejs.git", .upToNextMinor(from: "1.2.0")),
//        .package(name: "librlottie", url: "https://github.com/SDWebImage/librlottie-Xcode", .upToNextMinor(from: "0.2.0")),
//        .package(name: "libwebp", url: "https://github.com/SDWebImage/libwebp-Xcode", .upToNextMinor(from: "1.2.0"))
        .package(url: "https://github.com/SDWebImage/SDWebImageLottieCoder", .upToNextMinor(from: "0.2.0")),
        .package(name: "Gzip", url: "https://github.com/1024jp/GzipSwift", .upToNextMinor(from: "5.1.1")),
    ],
    targets: [
        .target(
            name: "TGWatchUI",
            dependencies: ["swift_qrcodejs", "SDWebImageLottieCoder", "Gzip"]
        ),
    ]
)
