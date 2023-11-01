//
//  ToDo.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

/// ToDo model.
struct ToDo: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}
