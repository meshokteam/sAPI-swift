import Foundation

class MeshokAPI {
    private let baseUrl = "https://api.meshok.net/sAPIv1/"
    private let token: String
    
    init(token: String) {
        self.token = token
    }
    
    private func sendRequest(method: String, params: [String: Any] = [:]) -> [String: Any]? {
        let url = URL(string: baseUrl + method)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = params.percentEncoded()
        
        let semaphore = DispatchSemaphore(value: 0)
        var response: [String: Any]?
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data {
                response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return response
    }
    
    func getItemList() -> [String: Any]? {
        return sendRequest(method: "getItemList")
    }
    
    func getFinishedItemList() -> [String: Any]? {
        return sendRequest(method: "getFinishedItemList")
    }
    
    func getUnsoldFinishedItemList() -> [String: Any]? {
        return sendRequest(method: "getUnsoldFinishedItemList")
    }
    
    func getSoldFinishedItemList() -> [String: Any]? {
        return sendRequest(method: "getSoldFinishedItemList")
    }
    
    func getItemInfo(id: String) -> [String: Any]? {
        return sendRequest(method: "getItemInfo", params: ["id": id])
    }
    
    func getAccountInfo() -> [String: Any]? {
        return sendRequest(method: "getAccountInfo")
    }
    
    func getCommonDescriptionList() -> [String: Any]? {
        return sendRequest(method: "getCommonDescriptionList")
    }
    
    func getSubCategory(id: String) -> [String: Any]? {
        return sendRequest(method: "getSubCategory", params: ["id": id])
    }
    
    func getCategoryInfo(id: String) -> [String: Any]? {
        return sendRequest(method: "getCategoryInfo", params: ["id": id])
    }
    
    func getCurencyList() -> [String: Any]? {
        return sendRequest(method: "getCurencyList")
    }
    
    func getCountryList() -> [String: Any]? {
        return sendRequest(method: "getCountryList")
    }
    
    func getCitiesList(id: String) -> [String: Any]? {
        return sendRequest(method: "getCitiesList", params: ["id": id])
    }
    
    func stopSale(id: String) -> [String: Any]? {
        return sendRequest(method: "stopSale", params: ["id": id])
    }
    
    func relistItem(id: String) -> [String: Any]? {
        return sendRequest(method: "relistItem", params: ["id": id])
    }
    
    func deleteItem(id: String) -> [String: Any]? {
        return sendRequest(method: "deleteItem", params: ["id": id])
    }
    
    func listItem(params: [String: Any]) -> [String: Any]? {
        return sendRequest(method: "listItem", params: params)
    }
    
    func updateItem(params: [String: Any]) -> [String: Any]? {
        return sendRequest(method: "updateItem", params: params)
    }
}

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "&+=")
        return allowed
    }()
}
