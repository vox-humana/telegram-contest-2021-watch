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
    targets: [
        .target(
            name: "TGWatchUI",
            dependencies: []
//            resources: [
//                .process("Resources/Assets.xcassets")
//            ]
        ),
    ]
)
