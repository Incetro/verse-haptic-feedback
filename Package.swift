// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VERSEHapticFeedback",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "VERSEHapticFeedback",
            targets: [
                "VERSEHapticFeedback"
            ]
        ),
    ],
    dependencies: [
        .package(
            name: "verse",
            url: "https://github.com/Incetro/verse",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "VERSEHapticFeedback",
            dependencies: [
                .product(name: "VERSE", package: "verse")
            ]
        )
    ]
)
