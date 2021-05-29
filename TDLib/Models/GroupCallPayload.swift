//
//  GroupCallPayload.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a payload for interaction with tgcalls
internal struct GroupCallPayload: Codable {
    /// The list of fingerprints
    internal let fingerprints: [GroupCallPayloadFingerprint]

    /// Value of the field pwd
    internal let pwd: String

    /// Value of the field ufrag
    internal let ufrag: String

    internal init(
        fingerprints: [GroupCallPayloadFingerprint],
        pwd: String,
        ufrag: String
    ) {
        self.fingerprints = fingerprints
        self.pwd = pwd
        self.ufrag = ufrag
    }
}
