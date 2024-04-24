// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CorePackage",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "CorePackage", targets: ["CorePackage"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.9.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CorePackage",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "shared",
            ],
            // https://www.swift.org/swift-evolution/#?search=accepted
            swiftSettings: [
                .enableExperimentalFeature("MoveOnlyPartialConsumption"),
                .enableExperimentalFeature("FullTypedThrows"),
                .enableExperimentalFeature("InternalImportsByDefault"),
            ]
        ),
        .testTarget(
            name: "CorePackageTests",
            dependencies: ["CorePackage"]
        ),
        // KMP binaryTarget
        .binaryTarget(
            name: "shared",
            path: "build/shared.xcframework"
        ),
    ]
)
