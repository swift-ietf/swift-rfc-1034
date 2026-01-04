// ===----------------------------------------------------------------------===//
//
// Copyright (c) 2025 Coen ten Thije Boonkkamp
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of project contributors
//
// SPDX-License-Identifier: Apache-2.0
//
// ===----------------------------------------------------------------------===//

// RFC_1034.Name.swift
// swift-rfc-1034
//
// RFC 1034 Section 3.1: Name Space Specifications

public import RFC_1035

extension RFC_1034 {
    /// Domain name type
    ///
    /// A domain name is a hierarchical identifier in the DNS namespace.
    /// Per RFC 1034 Section 3.1, domain names are case-insensitive.
    ///
    /// This is a type alias to ``RFC_1035.Domain`` which provides the
    /// implementation of domain name parsing and validation.
    ///
    /// ## RFC 1034 Constraints
    ///
    /// - Maximum 255 octets total length
    /// - Maximum 127 labels
    /// - Each label is 1-63 octets
    /// - Labels are separated by dots
    /// - Comparison is case-insensitive
    ///
    /// ## Example
    ///
    /// ```swift
    /// let name = try RFC_1034.Name("www.example.com")
    /// print(name.tld) // "com"
    /// ```
    public typealias Name = RFC_1035.Domain

    /// Label type
    ///
    /// A single component of a domain name.
    /// This is a type alias to ``RFC_1035.Domain.Label``.
    public typealias Label = RFC_1035.Domain.Label
}
