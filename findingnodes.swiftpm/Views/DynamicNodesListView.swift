//
//  DynamicNodesListView.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//


import SwiftUI

struct DynamicNodesListView: View {
    var nodes: [Node]

    var body: some View {
        ForEach(nodes, id: \.id) { node in
            node.view
                .accessibilityIdentifier("\(node.id)")
        }
    }
}
