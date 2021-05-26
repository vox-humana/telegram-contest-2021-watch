//
//  JSONDecoder+Result.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

extension JSONDecoder {
    func tryDecode<T>(_ type: T.Type, from data: Data) -> Result<T, Swift.Error> where T: Decodable {
        do {
            let result = try decode(type, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
