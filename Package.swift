// swift-tools-version: 6.2

import PackageDescription

extension String {
    static let rfc1034: Self = "RFC 1034"
}

extension Target.Dependency {
    static var rfc1034: Self { .target(name: .rfc1034) }
    static var rfc1035: Self { .product(name: "RFC 1035", package: "swift-rfc-1035") }
}

let package = Package(
    name: "swift-rfc-1034",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(name: "RFC 1034", targets: ["RFC 1034"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-rfc-1035.git", branch: "main")
    ],
    targets: [
        .target(
            name: "RFC 1034",
            dependencies: [
                .rfc1035
            ]
        ),
        .testTarget(
            name: "RFC 1034 Tests",
            dependencies: [
                "RFC 1034",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { self + " Tests" }
}

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
