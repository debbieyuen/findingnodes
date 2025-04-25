//
//  AddButtonsView.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//


import SwiftUI

struct AddButtonsView: View {
    @Binding var currentId: Int
    var addDynamicNode: (AnyView) -> Int

    var body: some View {
        HStack {
            Button("Add New Button") {
                let id = addDynamicNode(AnyView(
                    Button("Dynamic Button \(currentId)") {}
                        .buttonStyle(.bordered)
                ))
                print("Added dynamic button with ID \(id)")
            }

            Button("Add Button Group") {
                for _ in 0..<3 {
                    let id = currentId
                    let button = AnyView(
                        Button("Group Button \(id)") {
                            if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
                                UIApplication.shared.open(url)
                            }
                            print("Tapped group button with ID \(id)")
                        }
                        .accessibilityIdentifier("\(id)")
                        .buttonStyle(.bordered)
                    )
                    let addedId = addDynamicNode(button)
                    print("Added group button with ID \(addedId)")
                }
            }
        }
        .buttonStyle(.borderedProminent)
    }
}
