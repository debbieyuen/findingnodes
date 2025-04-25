//
//  NodeSearchView.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//


import SwiftUI

struct NodeSearchView: View {
    @Binding var searchId: String
    @Binding var foundNode: Node?
    var dynamicNodes: [Node]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter ID as an int to search", text: $searchId)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Search") {
                    if let id = Int(searchId) {
                        if let node = UIElementFinder.find(node: dynamicNodes, targetId: id) {
                            foundNode = node
                            print("Found node with ID \(id): \(node.id)")
                        } else {
                            foundNode = nil
                            print("Node with ID \(id) not found")
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
            }

            if let node = foundNode {
                Text("Found Node with ID \(node.id)")
            } else {
                Text("No Node found with the given ID.")
            }
        }
    }
}
