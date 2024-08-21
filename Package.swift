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
                "WitnessCalc",
            ]),
        .binaryTarget(name: "WitnessCalc",
                      url: "https://github.com/iden3/swift-iden3lib/releases/download/v0.0.1/witnesscalc.zip",
                      checksum: "293b5073cf33c83b6cf157776762d8676199a1c5b612c3f303f8b2ffe93ee358"),
        .binaryTarget(name: "Iden3CLibrary", path: "Iden3CLibrary.xcframework"),
    ]
)
