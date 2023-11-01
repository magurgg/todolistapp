//
//  ToDoCellView.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

import SwiftUI

/// ToDo cell view.
struct ToDoCellView: View {
    /// To Do item.
    var toDo: ToDo
    /// Number fo ToDo's in the list.
    var numberOfToDos: Int
    
    var body: some View {
        Section() {
            VStack(alignment: .leading) {
                let toDoId = toDo.id
                HStack {
                    AvatarView(text: toDoId.description)
                    Text(toDo.title)
                        .font(.system(.title3, weight: .semibold))
                }
                Gauge(value: Double(toDoId), in: 0...Double(numberOfToDos)) {
                } currentValueLabel: {
                    Text("Progress")
                        .font(.footnote)
                }
                Divider()
                HStack {
                    Text("User ID")
                    Spacer()
                    Text(toDo.userId.description)
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
                HStack {
                    Text("Completed")
                    Spacer()
                    let toDoCompleted = toDo.completed
                    Text(toDoCompleted.description)
                        .foregroundStyle(toDoCompleted ? Color.green : Color.red)
                }
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    ToDoCellView(toDo: ToDo(id: 1, userId: 999, title: "Lorem ipsum dolum", completed: false), numberOfToDos: 1)
}
