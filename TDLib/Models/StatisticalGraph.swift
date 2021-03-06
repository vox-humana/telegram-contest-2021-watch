//
//  StatisticalGraph.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a statistical graph
internal enum StatisticalGraph: Codable {
    /// A graph data
    case statisticalGraphData(StatisticalGraphData)

    /// The graph data to be asynchronously loaded through getStatisticalGraph
    case statisticalGraphAsync(StatisticalGraphAsync)

    /// An error message to be shown to the user instead of the graph
    case statisticalGraphError(StatisticalGraphError)

    private enum Kind: String, Codable {
        case statisticalGraphData
        case statisticalGraphAsync
        case statisticalGraphError
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .statisticalGraphData:
            let value = try StatisticalGraphData(from: decoder)
            self = .statisticalGraphData(value)
        case .statisticalGraphAsync:
            let value = try StatisticalGraphAsync(from: decoder)
            self = .statisticalGraphAsync(value)
        case .statisticalGraphError:
            let value = try StatisticalGraphError(from: decoder)
            self = .statisticalGraphError(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .statisticalGraphData(value):
            try container.encode(Kind.statisticalGraphData, forKey: .type)
            try value.encode(to: encoder)
        case let .statisticalGraphAsync(value):
            try container.encode(Kind.statisticalGraphAsync, forKey: .type)
            try value.encode(to: encoder)
        case let .statisticalGraphError(value):
            try container.encode(Kind.statisticalGraphError, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A graph data
internal struct StatisticalGraphData: Codable {
    /// Graph data in JSON format
    internal let jsonData: String

    /// If non-empty, a token which can be used to receive a zoomed in graph
    internal let zoomToken: String

    internal init(
        jsonData: String,
        zoomToken: String
    ) {
        self.jsonData = jsonData
        self.zoomToken = zoomToken
    }
}

/// The graph data to be asynchronously loaded through getStatisticalGraph
internal struct StatisticalGraphAsync: Codable {
    /// The token to use for data loading
    internal let token: String

    internal init(token: String) {
        self.token = token
    }
}

/// An error message to be shown to the user instead of the graph
internal struct StatisticalGraphError: Codable {
    /// The error message
    internal let errorMessage: String

    internal init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
}
