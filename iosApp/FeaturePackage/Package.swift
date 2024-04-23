// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeaturePackage",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "FeaturePackage", targets: ["FeaturePackage"]),
    ],
    dependencies: [
        .package(path: "../CorePackage"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FeaturePackage",
            // https://www.swift.org/swift-evolution/#?search=accepted
            swiftSettings: [
                .enableExperimentalFeature("MoveOnlyPartialConsumption"),
                .enableExperimentalFeature("FullTypedThrows"),
                .enableExperimentalFeature("InternalImportsByDefault"),
            ]
        ),
        .target(
            name: "AppFeature",
            // https://www.swift.org/swift-evolution/#?search=accepted
            dependencies: [
                "CorePackage"
            ],
            swiftSettings: [
                .enableExperimentalFeature("MoveOnlyPartialConsumption"),
                .enableExperimentalFeature("FullTypedThrows"),
                .enableExperimentalFeature("InternalImportsByDefault"),
            ]
        ),
        .testTarget(
            name: "FeaturePackageTests",
            dependencies: ["FeaturePackage"]
        ),
    ]
)
