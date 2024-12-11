// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibIden3",
    platforms: [
        .iOS(.v14),
        .macOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LibIden3",
            targets: [ "LibIden3" ]
        ),
    ],
    targets: [
        .target(
            name: "LibIden3",
            dependencies: [
                "LibIden3C",
            ],
            path: "Sources/LibIden3",
            sources: [
                "LibIden3.swift",
                "Codable+utils.swift",
                "String+utils.swift"
            ]
        ),
        .target(
            name: "LibIden3C",
            dependencies: ["Iden3CLibrary"],
            path: "Sources/LibIden3C"
        ),
        .binaryTarget(
            name: "Iden3CLibrary",
            path: "Iden3CLibrary.xcframework"
        ),
        .testTarget(
            name: "rapidsnarkTests",
            dependencies: [
                "LibIden3",
            ]
        )
    ]
)
