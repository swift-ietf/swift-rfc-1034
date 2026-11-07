/// RFC 1034: Domain Names - Concepts and Facilities
///
/// This namespace contains types representing the DNS conceptual model
/// as defined in RFC 1034 from November 1987.
///
/// RFC 1034 defines:
/// - The domain name space and resource records
/// - Name servers and zones
/// - Resolvers and the resolution process
///
/// ## Key Concepts
///
/// - **Domain Name**: A hierarchical identifier in the global DNS namespace
/// - **Label**: A single component of a domain name (max 63 octets)
/// - **Zone**: An administrative boundary containing authoritative data
/// - **Resource Record**: Data associated with a domain name
/// - **Name Server**: A program that stores and serves zone data
/// - **Resolver**: A program that queries name servers
///
/// ## Implementation Notes
///
/// Most implementation types are defined in RFC 1035. This package provides:
/// - Type aliases to RFC 1035 types
/// - Additional conceptual types for zones, queries, and resource records
///
/// ## Example
///
/// ```swift
/// // Domain names are defined in RFC 1035
/// let domain = try RFC_1034.Name("www.example.com")
///
/// // Query types
/// let queryType = RFC_1034.Query.Type.a
/// let queryClass = RFC_1034.Query.Class.internet
/// ```
///
/// ## See Also
///
/// - [RFC 1034](https://www.rfc-editor.org/rfc/rfc1034)
/// - [RFC 1035](https://www.rfc-editor.org/rfc/rfc1035) for implementation details
/// - ``RFC_1035`` for the DNS implementation specification
public enum RFC_1034 {}
