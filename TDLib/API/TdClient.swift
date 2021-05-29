//
//  TdClient.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Basic protocol for communicate with TdLib.
internal protocol TdClient {
    /// Receives incoming updates and request responses from the TDLib client
    func run(updateHandler: @escaping (Data) -> Void)

    /// Sends request to the TDLib client.
    func send(query: TdQuery, completion: ((Data) -> Void)?)

    /// Synchronously executes TDLib request. Only a few requests can be executed synchronously.
    func execute(query: TdQuery)

    /// Close connection with TDLib.
    func close()
}

internal protocol TdQuery {
    func make(with extra: String?) throws -> Data
}
