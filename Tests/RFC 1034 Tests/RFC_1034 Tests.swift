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

import Testing
@testable import RFC_1034

@Suite("RFC 1034 DNS Concepts Tests")
struct RFC1034Tests {

    @Suite("Name Tests")
    struct NameTests {
        @Test
        func `Name is alias for RFC_1035.Domain`() throws {
            let name = try RFC_1034.Name("www.example.com")
            #expect(name.rawValue == "www.example.com")
            #expect(name.tld?.rawValue == "com")
        }

        @Test
        func `Label is alias for RFC_1035.Domain.Label`() throws {
            let label = try RFC_1034.Label("example")
            #expect(label.rawValue == "example")
        }
    }

    @Suite("Query Type Tests")
    struct QueryTypeTests {
        @Test
        func `Standard query types have correct values`() {
            #expect(RFC_1034.Query.RecordType.a.rawValue == 1)
            #expect(RFC_1034.Query.RecordType.ns.rawValue == 2)
            #expect(RFC_1034.Query.RecordType.cname.rawValue == 5)
            #expect(RFC_1034.Query.RecordType.soa.rawValue == 6)
            #expect(RFC_1034.Query.RecordType.ptr.rawValue == 12)
            #expect(RFC_1034.Query.RecordType.mx.rawValue == 15)
            #expect(RFC_1034.Query.RecordType.txt.rawValue == 16)
            #expect(RFC_1034.Query.RecordType.aaaa.rawValue == 28)
            #expect(RFC_1034.Query.RecordType.srv.rawValue == 33)
            #expect(RFC_1034.Query.RecordType.opt.rawValue == 41)
        }

        @Test
        func `Query-only types have correct values`() {
            #expect(RFC_1034.Query.RecordType.axfr.rawValue == 252)
            #expect(RFC_1034.Query.RecordType.any.rawValue == 255)
        }
    }

    @Suite("Query Class Tests")
    struct QueryClassTests {
        @Test
        func `Standard classes have correct values`() {
            #expect(RFC_1034.Query.Class.internet.rawValue == 1)
            #expect(RFC_1034.Query.Class.csnet.rawValue == 2)
            #expect(RFC_1034.Query.Class.chaos.rawValue == 3)
            #expect(RFC_1034.Query.Class.hesiod.rawValue == 4)
            #expect(RFC_1034.Query.Class.any.rawValue == 255)
        }
    }

    @Suite("Resource TTL Tests")
    struct ResourceTTLTests {
        @Test
        func `Standard TTL values`() {
            #expect(RFC_1034.Resource.TTL.zero.rawValue == 0)
            #expect(RFC_1034.Resource.TTL.oneMinute.rawValue == 60)
            #expect(RFC_1034.Resource.TTL.fiveMinutes.rawValue == 300)
            #expect(RFC_1034.Resource.TTL.oneHour.rawValue == 3600)
            #expect(RFC_1034.Resource.TTL.oneDay.rawValue == 86400)
            #expect(RFC_1034.Resource.TTL.oneWeek.rawValue == 604800)
        }

        @Test
        func `TTL is comparable`() {
            #expect(RFC_1034.Resource.TTL.oneMinute < RFC_1034.Resource.TTL.oneHour)
            #expect(RFC_1034.Resource.TTL.oneDay > RFC_1034.Resource.TTL.oneHour)
        }
    }

    @Suite("Zone SOA Tests")
    struct ZoneSOATests {
        @Test
        func `SOA can be created`() throws {
            let soa = RFC_1034.Zone.SOA(
                primaryNameServer: try RFC_1034.Name("ns1.example.com"),
                responsibleMailbox: try RFC_1034.Name("admin.example.com"),
                serial: 2_024_010_101,
                refresh: 3600,
                retry: 600,
                expire: 604800,
                minimum: 300
            )

            #expect(soa.primaryNameServer.rawValue == "ns1.example.com")
            #expect(soa.serial == 2_024_010_101)
            #expect(soa.refresh == 3600)
        }
    }
}
