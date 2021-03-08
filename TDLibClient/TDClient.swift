import Foundation

final class TdClient {
    var client_id = td_create_client_id()
    let tdlibMainLoop = DispatchQueue(label: "TDLib")
    let tdlibQueryQueue = DispatchQueue(label: "TDLibQuery")
    var queryF = Dictionary<Int64, (Dictionary<String,Any>)->()>()
    var updateF: ((Dictionary<String,Any>)->())?
    var queryId: Int64 = 0

    func queryAsync(query: [String: Any], f: ((Dictionary<String,Any>)->())? = nil) {
        tdlibQueryQueue.async {
            var newQuery = query

            if f != nil {
                let nextQueryId = self.queryId + 1
                newQuery["@extra"] = nextQueryId
                self.queryF[nextQueryId] = f
                self.queryId = nextQueryId
            }
            td_send(self.client_id, to_json(newQuery))
        }
    }

    func querySync(query: [String: Any]) -> Dictionary<String,Any> {
        let semaphore = DispatchSemaphore(value:0)
        var result = Dictionary<String,Any>()
        queryAsync(query: query) {
            result = $0
            semaphore.signal()
        }
        semaphore.wait()
        return result
    }

    init() {
    }

    deinit {
    }

    func run(updateHandler: @escaping (Dictionary<String,Any>)->()) {
        updateF = updateHandler
        tdlibMainLoop.async { [weak self] in
            while (true) {
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

    private func queryResultAsync(_ result: String) {
        tdlibQueryQueue.async {
            let json = try? JSONSerialization.jsonObject(with: result.data(using: .utf8)!, options:[])
            if let dictionary = json as? [String:Any] {
                if let extra = dictionary["@extra"] as? Int64 {
                    let index = self.queryF.index(forKey: extra)!
                    self.queryF[index].value(dictionary)
                    self.queryF.remove(at: index)
                } else {
                    self.updateF!(dictionary)
                }
            }
        }
    }
}

func to_json(_ obj: Any) -> String {
    do {
        let obj = try JSONSerialization.data(withJSONObject: obj)
        return String(data: obj, encoding: .utf8)!
    } catch {
        return ""
    }
}
