//
//  MessageStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A detailed statistics about a message
internal struct MessageStatistics: Codable {
    /// A graph containing number of message views and shares
    internal let messageInteractionGraph: StatisticalGraph

    internal init(messageInteractionGraph: StatisticalGraph) {
        self.messageInteractionGraph = messageInteractionGraph
    }
}
