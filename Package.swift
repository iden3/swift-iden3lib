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
    dependencies: [
    ],
    targets: [
        .target(
            name: "LibIden3",
            dependencies: [
                "Iden3CLibrary",
            ]),
        .binaryTarget(name: "Iden3CLibrary", path: "Iden3CLibrary.xcframework"),
    ]
)
