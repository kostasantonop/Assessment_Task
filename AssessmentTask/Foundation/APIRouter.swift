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
    
    static let urlPrefix = "https://raw.githubusercontent.com/kfiliosNovibet/NoviTest/refs/heads/main/"
    
    case token = "token"
    case games = "livegames"
    case headlines = "headlines"
    case updatedGames = "updatedlivegames"
    case updatedHeadlines = "updatedheadlines"
    
    var urlString: String {
        return UrlFactory.urlPrefix + self.rawValue
    }
}

class APIRouter {
    static let shared = APIRouter()
    private init() {}
    var defaultHeaders: [String: String] = [:]

    func request<T: Codable>( urlString: String, params: [String: String]? = nil, method: APIRequestType = .get) -> Promise<T> {
        return Promise { resolver in
            guard var urlComponents = URLComponents(string: urlString) else {
                resolver.reject(NSError(domain: "Invalid URL", code: 0))
                return
            }

            if let params = params {
                urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
            }

            guard let url = urlComponents.url else {
                resolver.reject(NSError(domain: "Invalid URL after adding params", code: 0))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue

            for (key, value) in defaultHeaders {
                request.setValue(value, forHTTPHeaderField: key)
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    resolver.reject(error)
                    return
                }

                guard let data = data else {
                    resolver.reject(NSError(domain: "No data returned", code: 0))
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    resolver.fulfill(decoded)
                } catch {
                    resolver.reject(error)
                }
            }.resume()
        }
    }
}
