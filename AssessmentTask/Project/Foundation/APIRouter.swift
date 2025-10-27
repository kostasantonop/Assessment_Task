//
//  APIRouter.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import PromiseKit

enum APIRequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

enum UrlFactory: String {
    case token = "token"
    case games = "livegames"
    case headlines = "headlines"
    case updatedGames = "updatedlivegames"
    case updatedHeadlines = "updatedheadlines"
    
    private static let mainPrefix = "https://raw.githubusercontent.com/kfiliosNovibet/NoviTest/refs/heads/main/"
    private static let updatePrefix = "https://raw.githubusercontent.com/kfiliosNovibet/NoviTest/refs/heads/main/"
    
    func url(useUpdate: Bool = false) -> String {
        let prefix = useUpdate ? UrlFactory.updatePrefix : UrlFactory.mainPrefix
        return prefix + self.rawValue
    }
}

class APIRouter {
    static let shared = APIRouter()
    private init() {}
    var defaultHeaders: [String: String] = [:]
    
    func request<T: Codable>(urlString: String, params: [String: String]? = nil, method: APIRequestType = .get) -> Promise<T> {
        return Promise { resolver in
            guard let url = URL(string: urlString) else {
                resolver.reject(NSError(domain: "Invalid URL", code: 400))
                return
            }
            print("🛜 Method: \(method.rawValue)")
            print("⚡️ URL: \(url)")

            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            for (key, value) in defaultHeaders {
                request.addValue(value, forHTTPHeaderField: key)
            }

            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error { resolver.reject(error); return }
                guard let data = data else {
                    resolver.reject(NSError(domain: "No data returned", code: 0))
                    return
                }

                if let raw = String(data: data, encoding: .utf8) { print("📦 Raw response:\n\(raw)") }

                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    print("🟢 Decoded single object of \(T.self)")
                    resolver.fulfill(decoded)
                } catch {
                    print("❌ Decoding object failed:", error)
                    resolver.reject(error)
                }
            }.resume()
        }
    }
}
