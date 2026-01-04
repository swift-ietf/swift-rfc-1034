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

// RFC_1034.Resource.swift
// swift-rfc-1034
//
// RFC 1034 Section 3.6: Resource Records

extension RFC_1034 {
    /// Resource record namespace
    ///
    /// Contains types related to DNS resource records as defined in
    /// RFC 1034 Section 3.6.
    ///
    /// A resource record has:
    /// - Owner name: The domain name where the RR is found
    /// - Type: The type of resource (A, AAAA, MX, etc.)
    /// - Class: The class of resource (usually IN for Internet)
    /// - TTL: Time to live in seconds
    /// - RDATA: Resource-specific data
    public enum Resource {}
}

// MARK: - Type Aliases

extension RFC_1034.Resource {
    /// Resource record class
    ///
    /// Identical to query class for most purposes.
    public typealias Class = RFC_1034.Query.Class

    /// Resource record type
    ///
    /// Identical to query type for standard types.
    public typealias RecordType = RFC_1034.Query.RecordType
}
