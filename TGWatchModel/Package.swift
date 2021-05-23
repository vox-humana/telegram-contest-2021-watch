// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TGWatchModel",
    platforms: [
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "TGWatchModel",
            targets: ["TGWatchModel"]
        ),
    ],
    targets: [
        .target(
            name: "TGWatchModel",
            dependencies: []
        ),
        .testTarget(
            name: "TGWatchModelTests",
            dependencies: ["TGWatchModel"]
        ),
    ]
)
