//
//  APIProtocol.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

import Foundation

/// Enum to handle errors from the API.
enum APIError: Error {
    case error(String)
}

/// APIProtocol to implement in the network clients.
protocol APIProtocol {
    var session: URLSession { get }
    func request<T: Codable>(type: T.Type, with request: URLRequest) async throws -> T
}

extension APIProtocol {
    func request<T>(type: T.Type, with request: URLRequest) async throws -> T where T: Codable {
        let (data, response) = try await session.data(for: request)
        guard response is HTTPURLResponse else {
            throw APIError.error("Invalid response")
        }
        do {
            let decoder: JSONDecoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw APIError.error(error.localizedDescription)
        }
    }
}
