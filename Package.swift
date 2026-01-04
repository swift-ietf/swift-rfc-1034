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
        .visionOS(.v26),
    ],
    products: [
        .library(name: .rfc1034, targets: [.rfc1034])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-rfc-1035", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: .rfc1034,
            dependencies: [
                .rfc1035,
            ]
        ),
        .testTarget(
            name: .rfc1034.tests,
            dependencies: [
                .rfc1034
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { self + " Tests" }
}

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings =
        existing + [
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
        ]
}
