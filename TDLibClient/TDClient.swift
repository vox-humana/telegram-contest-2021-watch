// Based on https://github.com/tdlib/td/blob/master/example/swift/src/main.swift

import Foundation

final class TDCLient {
    typealias CompletionHandler = (Data) -> Void

    // TODO: replace with td_json_*
    private var client_id = td_create_client_id()
    private let tdlibMainLoop = DispatchQueue(label: "TDLib")
    private let tdlibQueryQueue = DispatchQueue(label: "TDLibQuery")
    private var queryF = [Int64: CompletionHandler]()
    private var updateF: CompletionHandler?
    private var queryId: Int64 = 0

    private func queryResultAsync(_ result: String) {
        tdlibQueryQueue.async {
            let data = result.data(using: .utf8)!
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any] {
                if
                    let extraStr = dictionary["@extra"] as? String,
                    let extra = Int64(extraStr)
                {
                    let index = self.queryF.index(forKey: extra)!
                    self.queryF[index].value(data)
                    self.queryF.remove(at: index)
                } else {
                    self.updateF!(data)
                }
            }
        }
    }
}

extension TDCLient: TdClient {
    func run(updateHandler: @escaping CompletionHandler) {
        updateF = updateHandler
        tdlibMainLoop.async { [weak self] in
            while true {
                if let s = self {
                    if let res = td_receive(10) {
                        let event = String(cString: res)

                        s.queryResultAsync(event)
                    }
                } else {
                    break
                }
            }
        }
    }

    func send(query: TdQuery, completion: CompletionHandler?) {
        tdlibQueryQueue.async {
            var extra: String?
            if completion != nil {
                let nextQueryId = self.queryId + 1
                extra = String(nextQueryId)
                self.queryF[nextQueryId] = completion
                self.queryId = nextQueryId
            }

            if let data = try? query.make(with: extra),
               let str = String(data: data, encoding: .utf8)
            {
                td_send(self.client_id, str)
            }
        }
    }

    func execute(query: TdQuery) {
        if
            let data = try? query.make(with: nil),
            let str = String(data: data, encoding: .utf8)
        {
            td_execute(str)
        }
    }

    func close() {
        assertionFailure("not implemented")
    }
}
