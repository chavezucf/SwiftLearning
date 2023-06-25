//
//  ListsExample.swift
//  SwiftUILearning
//
//  Created by Miguel Chavez on 6/25/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct ListsExample: View {
    @State var listData: [ToDoItem] = [ ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"), ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"), ToDoItem(task: "Wash the car", imageName: "car.fill") ]
    @State private var toggleStatus = true
    @State private var stackPath = NavigationPath()
    
    func deleteItem(at offsets: IndexSet) {
        // Delete items from the data source here
    }
    func moveItem(from source: IndexSet, to destination: Int) {
        // Reorder items in source data here
    }
    func addItem() {
        // Add items to source data here
    }
    var body: some View {
        NavigationStack(path: $stackPath){
            List{
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                Section(header: Text("To Do Tasks")) {
                    ForEach (listData) {
                        item in NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                    
                }
            }
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(leading: Button(action: addItem) {
                Text("Add")
            })
            .navigationBarItems(trailing: EditButton())
            .refreshable { listData.append(contentsOf: [ ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"), ToDoItem(task: "Call financial advisor", imageName: "phone.fill"), ToDoItem(task: "Sell the kids", imageName: "person.2.fill") ])
            }
            .navigationDestination(for: String.self) {
                task in Text("Selected task = \(task)")
            }
            .navigationDestination(for: Int.self) {
                count in Text("Number of tasks = \(count)")
            }
        }
        List {
            Text("Wash the car")
            .listRowSeparator(.hidden)
            Text("Pick up kids from school bus @ 3pm")
            .listRowSeparatorTint(.green)
            Text("Auction the kids on eBay")
            .listRowSeparatorTint(.red)
            Text("Order Pizza for dinner")
                .listRowBackground(Image(systemName: "car.fill"))
        }
    }
}

struct ToDoItem : Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

@available(iOS 16.0, *)
struct ListsExample_Previews: PreviewProvider {
    static var previews: some View {
        ListsExample()
    }
}
