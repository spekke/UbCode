// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
        .iOS("17.4"),
    ],
    products: [
        .library(
            name: "Clients",
            targets: ["Clients"]
        ),
        .library(
            name: "MoviesFeature",
            targets: ["MoviesFeature"]
        ),
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        
        // MARK: Clients
        .target(
            name: "Clients",
            dependencies: [
                "DataModels",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "DependenciesMacros", package: "swift-dependencies"),
            ],
            swiftSettings: [
              .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        
        // MARK: DataModels
        .target(
            name: "DataModels",
            swiftSettings: [
              .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        
        // MARK: Movies
        .target(
            name: "MoviesFeature",
            dependencies: [
                "Clients",
                "DataModels"
            ]
        ),
        .testTarget(
            name: "MoviesFeatureTests",
            dependencies: [
                "MoviesFeature"
            ],
            swiftSettings: [
              .enableExperimentalFeature("StrictConcurrency")
            ]
        )
    ]
)
