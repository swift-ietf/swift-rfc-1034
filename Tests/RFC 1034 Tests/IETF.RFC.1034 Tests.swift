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

enum `IETF.RFC.1034 Tests` {}

extension `IETF.RFC.1034 Tests` {
    @Suite
    struct `RFC 1034 DNS Concepts Tests` {
    }
}

extension `IETF.RFC.1034 Tests`.`RFC 1034 DNS Concepts Tests` {
    @Suite
    struct `Name Tests` {
        @Test
        func `Name is alias for IETF.RFC.1035.Domain`() throws {
            let name = try IETF.RFC.`1034`.Name("www.example.com")
            #expect(name.rawValue == "www.example.com")
            #expect(name.tld?.rawValue == "com")
        }

        @Test
        func `Label is alias for IETF.RFC.1035.Domain.Label`() throws {
            let label = try IETF.RFC.`1034`.Label("example")
            #expect(label.rawValue == "example")
        }
    }

    @Suite
    struct `Query Type Tests` {
        @Test
        func `Standard query types have correct values`() {
            #expect(IETF.RFC.`1034`.Query.RecordType.a.rawValue == 1)
            #expect(IETF.RFC.`1034`.Query.RecordType.ns.rawValue == 2)
            #expect(IETF.RFC.`1034`.Query.RecordType.cname.rawValue == 5)
            #expect(IETF.RFC.`1034`.Query.RecordType.soa.rawValue == 6)
            #expect(IETF.RFC.`1034`.Query.RecordType.ptr.rawValue == 12)
            #expect(IETF.RFC.`1034`.Query.RecordType.mx.rawValue == 15)
            #expect(IETF.RFC.`1034`.Query.RecordType.txt.rawValue == 16)
            #expect(IETF.RFC.`1034`.Query.RecordType.aaaa.rawValue == 28)
            #expect(IETF.RFC.`1034`.Query.RecordType.srv.rawValue == 33)
            #expect(IETF.RFC.`1034`.Query.RecordType.opt.rawValue == 41)
        }

        @Test
        func `Query-only types have correct values`() {
            #expect(IETF.RFC.`1034`.Query.RecordType.axfr.rawValue == 252)
            #expect(IETF.RFC.`1034`.Query.RecordType.any.rawValue == 255)
        }
    }

    @Suite
    struct `Query Class Tests` {
        @Test
        func `Standard classes have correct values`() {
            #expect(IETF.RFC.`1034`.Query.Class.internet.rawValue == 1)
            #expect(IETF.RFC.`1034`.Query.Class.csnet.rawValue == 2)
            #expect(IETF.RFC.`1034`.Query.Class.chaos.rawValue == 3)
            #expect(IETF.RFC.`1034`.Query.Class.hesiod.rawValue == 4)
            #expect(IETF.RFC.`1034`.Query.Class.any.rawValue == 255)
        }
    }

    @Suite
    struct `Resource TTL Tests` {
        @Test
        func `Standard TTL values`() {
            #expect(IETF.RFC.`1034`.Resource.TTL.zero.rawValue == 0)
            #expect(IETF.RFC.`1034`.Resource.TTL.oneMinute.rawValue == 60)
            #expect(IETF.RFC.`1034`.Resource.TTL.fiveMinutes.rawValue == 300)
            #expect(IETF.RFC.`1034`.Resource.TTL.oneHour.rawValue == 3600)
            #expect(IETF.RFC.`1034`.Resource.TTL.oneDay.rawValue == 86400)
            #expect(IETF.RFC.`1034`.Resource.TTL.oneWeek.rawValue == 604800)
        }

        @Test
        func `TTL is comparable`() {
            #expect(IETF.RFC.`1034`.Resource.TTL.oneMinute < IETF.RFC.`1034`.Resource.TTL.oneHour)
            #expect(IETF.RFC.`1034`.Resource.TTL.oneDay > IETF.RFC.`1034`.Resource.TTL.oneHour)
        }
    }

    @Suite
    struct `Zone SOA Tests` {
        @Test
        func `SOA can be created`() throws {
            let soa = IETF.RFC.`1034`.Zone.SOA(
                primaryNameServer: try IETF.RFC.`1034`.Name("ns1.example.com"),
                responsibleMailbox: try IETF.RFC.`1034`.Name("admin.example.com"),
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
