// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "enzottic.me.m",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
        .package(url: "https://github.com/johnsundell/ink.git", from: "0.1.0"),
//        .package(url: "https://github.com/sliemeobn/elementary.git", from: "0.1.2"),
        .package(url: "https://github.com/pointfreeco/swift-html", from: "0.4.0"),
        .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "enzottic.me.m",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Ink", package: "ink"),
//                .product(name: "Elementary", package: "elementary"),
                .product(name: "Html", package: "swift-html"),
                .product(name: "Markdown", package: "swift-markdown")
            ]
        ),
    ]
)
