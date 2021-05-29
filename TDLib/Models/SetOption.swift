//
//  SetOption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization
internal struct SetOption: Codable {
    /// The name of the option
    internal let name: String

    /// The new value of the option
    internal let value: OptionValue

    internal init(
        name: String,
        value: OptionValue
    ) {
        self.name = name
        self.value = value
    }
}
