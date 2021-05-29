//
//  SetTdlibParameters.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters
internal struct SetTdlibParameters: Codable {
    /// Parameters
    internal let parameters: TdlibParameters

    internal init(parameters: TdlibParameters) {
        self.parameters = parameters
    }
}
