//
//  GetStatisticalGraph.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Loads an asynchronous or a zoomed in statistical graph
internal struct GetStatisticalGraph: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The token for graph loading
    internal let token: String

    /// X-value for zoomed in graph or 0 otherwise
    internal let x: Int64

    internal init(
        chatId: Int64,
        token: String,
        x: Int64
    ) {
        self.chatId = chatId
        self.token = token
        self.x = x
    }
}
