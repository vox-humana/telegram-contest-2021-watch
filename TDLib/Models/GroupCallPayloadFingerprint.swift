//
//  GroupCallPayloadFingerprint.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a payload fingerprint for interaction with tgcalls
internal struct GroupCallPayloadFingerprint: Codable {
    /// Value of the field fingerprint
    internal let fingerprint: String

    /// Value of the field hash
    internal let hash: String

    /// Value of the field setup
    internal let setup: String

    internal init(
        fingerprint: String,
        hash: String,
        setup: String
    ) {
        self.fingerprint = fingerprint
        self.hash = hash
        self.setup = setup
    }
}
