// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CoreMathematics",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "CoreMathematics", targets: ["CoreMathematics"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "CoreMathematics", dependencies: []),
        .testTarget(name: "CoreMathematicsTests", dependencies: ["CoreMathematics"]),
    ]
)
