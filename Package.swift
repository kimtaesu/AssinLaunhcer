// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "AssinLaunhcer",
    products: [
        .library(
            name: "AssinLaunhcer",
            targets: ["AssinLaunhcer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AssinLaunhcer",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "AssinLaunhcerTests",
            dependencies: ["AssinLaunhcer"],
            path: "Tests"
        ),
    ]
)
