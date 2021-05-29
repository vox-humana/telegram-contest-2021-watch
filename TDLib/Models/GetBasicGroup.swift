//
//  GetBasicGroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot
internal struct GetBasicGroup: Codable {
    /// Basic group identifier
    internal let basicGroupId: Int

    internal init(basicGroupId: Int) {
        self.basicGroupId = basicGroupId
    }
}
