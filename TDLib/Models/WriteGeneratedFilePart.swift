//
//  WriteGeneratedFilePart.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file
internal struct WriteGeneratedFilePart: Codable {
    /// The data to write
    internal let data: Data

    /// The identifier of the generation process
    internal let generationId: TdInt64

    /// The offset from which to write the data to the file
    internal let offset: Int

    internal init(
        data: Data,
        generationId: TdInt64,
        offset: Int
    ) {
        self.data = data
        self.generationId = generationId
        self.offset = offset
    }
}
