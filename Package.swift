// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "vapor-alisms",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "AliSMS", targets: ["AliSMS"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc"),
        .package(url: "https://github.com/apple/swift-crypto.git", from: "1.0.1")
//        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.3.0")
    ],
    targets: [
        .target(name: "AliSMS", dependencies: [
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Crypto", package: "swift-crypto")
//            .product(name: "CryptoSwift", package: "CryptoSwift")
        ])
    ]
)
