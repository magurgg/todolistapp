//
//  ListItemViewModel.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

import Foundation

/// ViewModel for the ListItemView.
class ListItemViewModel: ObservableObject {
    /// ToDo's array with the information.
    @Published var toDos: [ToDo] = []
    /// Checks if there is any error.
    @Published var hasError: Bool = false
    /// Network client for requesting information from the page.
    private let networkClient = NetworkClient()
    
    /// Request to get the toDos JSON.
    func getToDos() async {
        do {
            let response = try await networkClient.getToDos()
            /// Assign value in the main thread.
            DispatchQueue.main.async {
                self.toDos = response
            }
        } catch {
            DispatchQueue.main.async {
                self.hasError = true
            }
        }
    }
}
