// swift-tools-version: 5.9
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
            name: "Movies",
            targets: ["Movies"]
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
            ]
        ),
        
        // MARK: DataModels
        .target(
            name: "DataModels"
        ),
        
        // MARK: Movies
        .target(
            name: "Movies"
        ),
        .testTarget(
            name: "MoviesTests",
            dependencies: [
                "Movies",
                "DataModels"
            ]
        )
    ]
)
