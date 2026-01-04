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

// RFC_1034.Query.RecordType.swift
// swift-rfc-1034
//
// RFC 1034 Section 3.7: Queries

extension RFC_1034.Query {
    /// Query type (QTYPE)
    ///
    /// Specifies the type of resource record being requested.
    /// Per RFC 1034 Section 3.7.1.
    ///
    /// ## Standard Types
    ///
    /// - A (1): IPv4 address
    /// - NS (2): Authoritative name server
    /// - CNAME (5): Canonical name
    /// - SOA (6): Start of authority
    /// - PTR (12): Domain name pointer
    /// - MX (15): Mail exchange
    /// - TXT (16): Text strings
    /// - AAAA (28): IPv6 address (RFC 3596)
    ///
    /// ## Query-Only Types
    ///
    /// - AXFR (252): Zone transfer
    /// - ANY (255): All records
    public struct RecordType: RawRepresentable, Sendable, Hashable, Codable {
        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// Creates a query type WITHOUT validation
        init(__unchecked: Void, rawValue: UInt16) {
            self.rawValue = rawValue
        }
    }
}

// MARK: - Standard Types

extension RFC_1034.Query.RecordType {
    /// A (1): IPv4 host address
    public static let a = Self(__unchecked: (), rawValue: 1)

    /// NS (2): Authoritative name server
    public static let ns = Self(__unchecked: (), rawValue: 2)

    /// CNAME (5): Canonical name for an alias
    public static let cname = Self(__unchecked: (), rawValue: 5)

    /// SOA (6): Start of zone of authority
    public static let soa = Self(__unchecked: (), rawValue: 6)

    /// PTR (12): Domain name pointer
    public static let ptr = Self(__unchecked: (), rawValue: 12)

    /// MX (15): Mail exchange
    public static let mx = Self(__unchecked: (), rawValue: 15)

    /// TXT (16): Text strings
    public static let txt = Self(__unchecked: (), rawValue: 16)

    /// AAAA (28): IPv6 host address (RFC 3596)
    public static let aaaa = Self(__unchecked: (), rawValue: 28)

    /// SRV (33): Service locator (RFC 2782)
    public static let srv = Self(__unchecked: (), rawValue: 33)

    /// OPT (41): EDNS option (RFC 6891)
    public static let opt = Self(__unchecked: (), rawValue: 41)
}

// MARK: - Query-Only Types

extension RFC_1034.Query.RecordType {
    /// AXFR (252): Zone transfer request
    public static let axfr = Self(__unchecked: (), rawValue: 252)

    /// ANY (255): Request for all records
    public static let any = Self(__unchecked: (), rawValue: 255)
}
