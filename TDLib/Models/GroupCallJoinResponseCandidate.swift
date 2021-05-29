//
//  GroupCallJoinResponseCandidate.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a join response candidate for interaction with tgcalls
internal struct GroupCallJoinResponseCandidate: Codable {
    /// Value of the field component
    internal let component: String

    /// Value of the field foundation
    internal let foundation: String

    /// Value of the field generation
    internal let generation: String

    /// Value of the field id
    internal let id: String

    /// Value of the field ip
    internal let ip: String

    /// Value of the field network
    internal let network: String

    /// Value of the field port
    internal let port: String

    /// Value of the field priority
    internal let priority: String

    /// Value of the field protocol
    internal let `protocol`: String

    /// Value of the field rel_addr
    internal let relAddr: String

    /// Value of the field rel_port
    internal let relPort: String

    /// Value of the field tcp_type
    internal let tcpType: String

    /// Value of the field type
    internal let type: String

    internal init(
        component: String,
        foundation: String,
        generation: String,
        id: String,
        ip: String,
        network: String,
        port: String,
        priority: String,
        protocol: String,
        relAddr: String,
        relPort: String,
        tcpType: String,
        type: String
    ) {
        self.component = component
        self.foundation = foundation
        self.generation = generation
        self.id = id
        self.ip = ip
        self.network = network
        self.port = port
        self.priority = priority
        self.protocol = `protocol`
        self.relAddr = relAddr
        self.relPort = relPort
        self.tcpType = tcpType
        self.type = type
    }
}
