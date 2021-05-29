//
//  LoadGroupCallParticipants.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Loads more participants of a group call. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants has already been loaded
internal struct LoadGroupCallParticipants: Codable {
    /// Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
    internal let groupCallId: Int

    /// The maximum number of participants to load
    internal let limit: Int

    internal init(
        groupCallId: Int,
        limit: Int
    ) {
        self.groupCallId = groupCallId
        self.limit = limit
    }
}
