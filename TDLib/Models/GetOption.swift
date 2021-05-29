//
//  GetOption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization
internal struct GetOption: Codable {
    /// The name of the option
    internal let name: String

    internal init(name: String) {
        self.name = name
    }
}
