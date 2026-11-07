extension RFC_1034.Query {
    /// Query class (QCLASS)
    ///
    /// Specifies the class of the query.
    /// Per RFC 1034 Section 3.7.1.
    ///
    /// The only class in widespread use is IN (Internet).
    public struct Class: RawRepresentable, Sendable, Hashable, Codable {
        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// Creates a query class WITHOUT validation
        init(__unchecked: Void, rawValue: UInt16) {
            self.rawValue = rawValue
        }
    }
}

extension RFC_1034.Query.Class {
    /// IN (1): Internet
    public static let internet = Self(__unchecked: (), rawValue: 1)

    /// CS (2): CSNET (obsolete)
    public static let csnet = Self(__unchecked: (), rawValue: 2)

    /// CH (3): CHAOS
    public static let chaos = Self(__unchecked: (), rawValue: 3)

    /// HS (4): Hesiod
    public static let hesiod = Self(__unchecked: (), rawValue: 4)

    /// ANY (255): Any class
    public static let any = Self(__unchecked: (), rawValue: 255)
}
