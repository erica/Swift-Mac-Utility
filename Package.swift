// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-Mac-Utility",
    platforms: [
      .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "MacUtility",
            targets: ["MacUtility"]),
    ],
    dependencies: [
        .package(url: "https://github.com/erica/Swift-General-Utility", from: "0.0.6"),
    ],
    targets: [
        .target(
            name: "MacUtility",
            dependencies: [
                .product(name: "GeneralUtility", package: "Swift-General-Utility"),
            ],
            path: "Sources/"
            ),
        .testTarget(
            name: "Tests",
            dependencies: ["MacUtility"])
    ],
    swiftLanguageVersions: [
      .v5
    ]
)
