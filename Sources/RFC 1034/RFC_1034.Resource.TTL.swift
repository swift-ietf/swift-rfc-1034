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

// RFC_1034.Resource.TTL.swift
// swift-rfc-1034
//
// RFC 1034 Section 3.6: Resource Records

extension RFC_1034.Resource {
    /// Time-to-live value in seconds
    ///
    /// Per RFC 1034 Section 3.6, TTL is a 32-bit unsigned integer
    /// specifying the time interval that the resource record may be
    /// cached before it should be discarded.
    ///
    /// A TTL of zero means the RR should not be cached.
    public struct TTL: RawRepresentable, Sendable, Hashable, Codable, Comparable {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        /// Creates a TTL WITHOUT validation
        init(__unchecked: Void, rawValue: UInt32) {
            self.rawValue = rawValue
        }

        public static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}

// MARK: - Standard TTL Values

extension RFC_1034.Resource.TTL {
    /// Zero TTL - do not cache
    public static let zero = Self(__unchecked: (), rawValue: 0)

    /// One minute
    public static let oneMinute = Self(__unchecked: (), rawValue: 60)

    /// Five minutes
    public static let fiveMinutes = Self(__unchecked: (), rawValue: 300)

    /// One hour
    public static let oneHour = Self(__unchecked: (), rawValue: 3600)

    /// One day
    public static let oneDay = Self(__unchecked: (), rawValue: 86400)

    /// One week
    public static let oneWeek = Self(__unchecked: (), rawValue: 604800)
}
