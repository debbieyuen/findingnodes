//
//  ContentView.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var nodeManager = DynamicNodeHelper()
    @State private var searchId: String = ""
    @State private var foundNode: Node? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HeaderMessageView()

                    NodeSearchView(
                        searchId: $searchId,
                        foundNode: $foundNode,
                        dynamicNodes: nodeManager.dynamicNodes
                    )

                    AddButtonsView(
//                        currentId: $nodeManager.currentId,
//                        addDynamicNode: nodeManager.add
//                        getNextId: nodeManager.getNextID,
                        addDynamicNode: nodeManager.add,
                        addGroupWithButtons: { nodeManager.addGroupWithButtons(url: "https://debbieyuen.github.io/heyapple/") }
                    )

                    DynamicNodesListView(nodes: nodeManager.dynamicNodes)

                    Spacer(minLength: 40)
                }
                .padding()
            }
            .navigationTitle("Dynamic UI with DFS")
        }
    }
}
