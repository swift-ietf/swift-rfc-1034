# swift-rfc-1034

Use this package when you need the shared DNS vocabulary of RFC 1034 in your own types: domain names and labels, query types and classes, resource record TTLs, and the data of a zone's SOA record. Start from `RFC_1034.Name`, `RFC_1034.Query.RecordType`, `RFC_1034.Query.Class`, `RFC_1034.Resource.TTL` and `RFC_1034.Zone.SOA`. The package holds values only. For the DNS wire format, use swift-rfc-1035. For AAAA records and ip6.arpa names, use swift-rfc-3596. To resolve names, use swift-domain-name-system.
