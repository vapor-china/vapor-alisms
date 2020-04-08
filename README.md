<img src="images/banner.png"/>

[![Build Status](https://img.shields.io/badge/platforms-macOS%20%7C%20Ubuntu-green.svg)](https://github.com/Jinxiansen/SwiftUI)
[![Swift](https://img.shields.io/badge/Swift-5.2-orange.svg)](https://swift.org)
[![Swift](https://img.shields.io/badge/Vapor-4-orange.svg)](https://vapor.codes)
[![Xcode](https://img.shields.io/badge/Xcode-11.4-blue.svg)](https://developer.apple.com/xcode)
[![Xcode](https://img.shields.io/badge/macOS-15.0-blue.svg)](https://developer.apple.com/macOS)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)



`AliSMS` is a vapor 4 kit of alibab cloud sms service. It support macOS, Ubuntu. You can use the kit to call alibab cloud sms service. 

Thank you supporting and using vapor, we are growing.

[中文版🇨🇳](README_CN.md)

## Installation

### Swift Package Manager

To integrate using Apple's Swift package manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/vapor-china/vapor-alisms.git", from: "1.0.1")
```

Here's an example `PackageDescription`:

```swift
// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "MyPackage",
    products: [
        .library(
            name: "MyPackage",
            targets: ["MyPackage"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-rc"),
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.0.0-rc"),
        .package(url: "https://github.com/SpectatorNanWithZZC/vapor-alisms.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: [
            .product(name: "Fluent", package: "fluent"),
            .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
            .product(name: "Vapor", package: "vapor"),
            .product(name: "AliSMS", package: "vapor-alisms")
        ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
```

## Usage

```swift
        let client = AlismsClient(scheme: "https", accessKeyId: "key", accessKeySecret: "secret")
        
        try client.sendSms(code: SMSCode(code: "123456"), phone: "13812341234", signName: "you sign name", templateCode: "you template code", req: req)
```

## Features

 Send Batch SMS

## License

AliSMS is released under an MIT license. See [License.md](https://github.com/SpectatorNanWithZZC/vapor-alisms/blob/master/LICENSE) for more information.
