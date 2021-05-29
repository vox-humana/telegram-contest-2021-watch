//
//  GetBasicGroupFullInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns full information about a basic group by its identifier
internal struct GetBasicGroupFullInfo: Codable {
    /// Basic group identifier
    internal let basicGroupId: Int

    internal init(basicGroupId: Int) {
        self.basicGroupId = basicGroupId
    }
}
