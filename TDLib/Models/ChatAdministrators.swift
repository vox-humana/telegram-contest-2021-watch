//
//  ChatAdministrators.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of chat administrators
internal struct ChatAdministrators: Codable {
    /// A list of chat administrators
    internal let administrators: [ChatAdministrator]

    internal init(administrators: [ChatAdministrator]) {
        self.administrators = administrators
    }
}
