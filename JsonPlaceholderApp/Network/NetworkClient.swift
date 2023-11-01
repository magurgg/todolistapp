//
//  NetworkClient.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

import Foundation

/// Network client class.
final class NetworkClient: APIProtocol {
    /// URLSession of the client.
    let session: URLSession

    init() {
        self.session = URLSession(configuration: .default)
    }

    /// Gets the list of To Do's from the corresponding endpoint.
    /// - Returns: Array of To Do's.
    func getToDos() async throws -> [ToDo] {
        guard let url = URL(string: Constants.toDoURL) else {
            return []
        }
        let request = URLRequest(url: url)
        let response = try await self.request(type: [ToDo].self, with: request)
        return response
    }
}
