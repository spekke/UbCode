// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
        .iOS("17.0"),
    ],
    products: [
        .library(
            name: "Movies",
            targets: ["Movies"]),
    ],
    targets: [
        
        // MARK: Clients
        .target(
            name: "Clients",
            dependencies: [
                "DataModels"
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
