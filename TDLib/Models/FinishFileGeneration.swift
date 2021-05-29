//
//  FinishFileGeneration.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Finishes the file generation
internal struct FinishFileGeneration: Codable {
    /// If set, means that file generation has failed and should be terminated
    internal let error: Error

    /// The identifier of the generation process
    internal let generationId: TdInt64

    internal init(
        error: Error,
        generationId: TdInt64
    ) {
        self.error = error
        self.generationId = generationId
    }
}
