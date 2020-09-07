// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeatherProvider",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "WeatherProvider",
            targets: ["WeatherProvider"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/GEOSwift/GEOSwift.git", from: "7.0.0"),
        .package(url: "https://github.com/ualch9/GeohashKit.git", from: "2.0.0"),

        .package(url: "https://github.com/ualch9/NationalWeatherService-Swift.git", from: "0.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "WeatherProvider",
            dependencies: [
                .product(name: "GEOSwift", package: "GEOSwift"),
                .product(name: "GeohashKit", package: "GeohashKit"),
                "NationalWeatherService"
//                .product(name: "NationalWeatherService", package: "NationalWeatherService-Swift")
            ]),
        .testTarget(
            name: "WeatherProviderTests",
            dependencies: ["WeatherProvider"]),
    ]
)
