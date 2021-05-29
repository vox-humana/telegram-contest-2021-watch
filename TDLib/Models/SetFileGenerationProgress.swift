//
//  SetFileGenerationProgress.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs TDLib on a file generation progress
internal struct SetFileGenerationProgress: Codable {
    /// Expected size of the generated file, in bytes; 0 if unknown
    internal let expectedSize: Int

    /// The identifier of the generation process
    internal let generationId: TdInt64

    /// The number of bytes already generated
    internal let localPrefixSize: Int

    internal init(
        expectedSize: Int,
        generationId: TdInt64,
        localPrefixSize: Int
    ) {
        self.expectedSize = expectedSize
        self.generationId = generationId
        self.localPrefixSize = localPrefixSize
    }
}
