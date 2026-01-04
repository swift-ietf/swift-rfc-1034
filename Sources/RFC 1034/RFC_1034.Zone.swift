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

// RFC_1034.Zone.swift
// swift-rfc-1034
//
// RFC 1034 Section 4.2: Zone Data

extension RFC_1034 {
    /// Zone namespace
    ///
    /// Contains types related to DNS zones as defined in RFC 1034 Section 4.2.
    ///
    /// A zone is a contiguous portion of the domain name space for which
    /// a name server has complete information and authority.
    public enum Zone {}
}

extension RFC_1034.Zone {
    /// Start of Authority (SOA) record data
    ///
    /// Per RFC 1034 Section 4.2.1, every zone must have exactly one SOA
    /// record at the zone apex.
    ///
    /// The SOA record contains administrative information about the zone.
    public struct SOA: Sendable, Hashable, Codable {
        /// Primary name server for this zone
        public let primaryNameServer: RFC_1034.Name

        /// Email address of the zone administrator (@ replaced with .)
        public let responsibleMailbox: RFC_1034.Name

        /// Zone serial number (incremented on each change)
        public let serial: UInt32

        /// Refresh interval in seconds
        public let refresh: UInt32

        /// Retry interval in seconds
        public let retry: UInt32

        /// Expire time in seconds
        public let expire: UInt32

        /// Minimum TTL for negative caching
        public let minimum: UInt32

        public init(
            primaryNameServer: RFC_1034.Name,
            responsibleMailbox: RFC_1034.Name,
            serial: UInt32,
            refresh: UInt32,
            retry: UInt32,
            expire: UInt32,
            minimum: UInt32
        ) {
            self.primaryNameServer = primaryNameServer
            self.responsibleMailbox = responsibleMailbox
            self.serial = serial
            self.refresh = refresh
            self.retry = retry
            self.expire = expire
            self.minimum = minimum
        }
    }
}
