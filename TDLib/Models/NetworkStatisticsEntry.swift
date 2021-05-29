//
//  NetworkStatisticsEntry.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains statistics about network usage
internal enum NetworkStatisticsEntry: Codable {
    /// Contains information about the total amount of data that was used to send and receive files
    case networkStatisticsEntryFile(NetworkStatisticsEntryFile)

    /// Contains information about the total amount of data that was used for calls
    case networkStatisticsEntryCall(NetworkStatisticsEntryCall)

    private enum Kind: String, Codable {
        case networkStatisticsEntryFile
        case networkStatisticsEntryCall
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .networkStatisticsEntryFile:
            let value = try NetworkStatisticsEntryFile(from: decoder)
            self = .networkStatisticsEntryFile(value)
        case .networkStatisticsEntryCall:
            let value = try NetworkStatisticsEntryCall(from: decoder)
            self = .networkStatisticsEntryCall(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .networkStatisticsEntryFile(value):
            try container.encode(Kind.networkStatisticsEntryFile, forKey: .type)
            try value.encode(to: encoder)
        case let .networkStatisticsEntryCall(value):
            try container.encode(Kind.networkStatisticsEntryCall, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Contains information about the total amount of data that was used to send and receive files
internal struct NetworkStatisticsEntryFile: Codable {
    /// Type of the file the data is part of
    internal let fileType: FileType

    /// Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
    internal let networkType: NetworkType

    /// Total number of bytes received
    internal let receivedBytes: Int64

    /// Total number of bytes sent
    internal let sentBytes: Int64

    internal init(
        fileType: FileType,
        networkType: NetworkType,
        receivedBytes: Int64,
        sentBytes: Int64
    ) {
        self.fileType = fileType
        self.networkType = networkType
        self.receivedBytes = receivedBytes
        self.sentBytes = sentBytes
    }
}

/// Contains information about the total amount of data that was used for calls
internal struct NetworkStatisticsEntryCall: Codable {
    /// Total call duration, in seconds
    internal let duration: Double

    /// Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
    internal let networkType: NetworkType

    /// Total number of bytes received
    internal let receivedBytes: Int64

    /// Total number of bytes sent
    internal let sentBytes: Int64

    internal init(
        duration: Double,
        networkType: NetworkType,
        receivedBytes: Int64,
        sentBytes: Int64
    ) {
        self.duration = duration
        self.networkType = networkType
        self.receivedBytes = receivedBytes
        self.sentBytes = sentBytes
    }
}
