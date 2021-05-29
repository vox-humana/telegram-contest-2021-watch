//
//  TestSquareInt.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the squared received number; for testing only. This is an offline method. Can be called before authorization
internal struct TestSquareInt: Codable {
    /// Number to square
    internal let x: Int

    internal init(x: Int) {
        self.x = x
    }
}
