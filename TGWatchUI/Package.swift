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
    ],
    targets: [
        .target(
            name: "TGWatchUI",
            dependencies: ["swift_qrcodejs"]
        ),
    ]
)
