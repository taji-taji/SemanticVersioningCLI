// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "semver",
  platforms: [
    .macOS(.v10_13),
  ],
  products: [
    .executable(name: "semver",
                targets: [
                  "semver",
                ]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    .package(url: "https://github.com/taji-taji/SemanticVersioning.git", from: "0.0.1"),
  ],
  targets: [
    .executableTarget(
      name: "semver",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        "SemanticVersioning",
      ]),
    .testTarget(
      name: "semverTests",
      dependencies: ["semver"]),
    ]
)
