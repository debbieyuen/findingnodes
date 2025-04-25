//
//  AddButtonsView.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//

import SwiftUI

struct AddButtonsView: View {
    var addDynamicNode: (@escaping (Int) -> AnyView) -> Int
    var addGroupWithButtons: () -> Int

    var body: some View {
        HStack(spacing: 16) {
            Button("Add New Button") {
                let id = addDynamicNode { id in
                    AnyView(
                        Button("Dynamic Button \(id)") {
                            if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
                                UIApplication.shared.open(url)
                            }
                            print("Tapped dynamic button with ID \(id)")
                        }
                        .buttonStyle(.bordered)
                        .accessibilityIdentifier("node_\(id)")
                    )
                }
                print("Added dynamic button with ID \(id)")
            }

            Button("Add Button Group") {
                let groupId = addGroupWithButtons()
                print("Added group HStack node with ID \(groupId) and 4 button children")
            }
        }
        .padding(.vertical, 8)
        .buttonStyle(.borderedProminent)
    }
}
