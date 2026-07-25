# swift-rfc-1034

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The DNS name space, resource records, and domain-name concepts of RFC 1034.

## Standard Reference

- **RFC**: 1034
- **Title**: Domain Names — Concepts and Facilities

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/swift-ietf/swift-rfc-1034.git", from: "0.0.1")
]
```

Add the product to a target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "RFC 1034", package: "swift-rfc-1034")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
