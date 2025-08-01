// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BudgetSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BudgetSDK",
            targets: ["BudgetSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/markiv/SwiftUI-Shimmer.git", from: "1.5.1")
    ],
    targets: [
        .binaryTarget(
            name: "BudgetSDK",
            path: "BudgetSDK.xcframework"
        )
    ]
)