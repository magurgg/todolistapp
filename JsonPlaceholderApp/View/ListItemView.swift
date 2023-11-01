//
//  ListItemView.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

import SwiftUI

/// View to display the ToDo's list.
struct ListItemView: View {
    /// ViewModel for this view.
    @StateObject var viewModel: ListItemViewModel = ListItemViewModel()

    var body: some View {
            NavigationView {
                let toDos = viewModel.toDos
                let numberOfToDos = toDos.count
                List(toDos, id: \.id) { toDo in
                    ToDoCellView(toDo: toDo, numberOfToDos: numberOfToDos)
                }
                .task {
                    await viewModel.getToDos()
                }
                .refreshable {
                    await viewModel.getToDos()
                }
                .alert("Oops.", isPresented: $viewModel.hasError) {} message: {
                    Text("Sorry, we couldn't present the items at this time. Try again later.")
                }
                .listStyle(.insetGrouped)
                .navigationTitle("To Do items")
            }
        }
}

#Preview {
    ListItemView()
}
