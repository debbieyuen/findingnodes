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
                    Button("Dynamic Button \(currentId)") {
                        if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
                            UIApplication.shared.open(url)
                        }
                    }
                        .buttonStyle(.bordered)
                ))
                print("Added dynamic button with ID \(id)")
            }

            Button("Add Button Group") {
                let groupStartId = currentId
                let buttons = (0..<4).map { offset in
                    let id = groupStartId + offset
                    return AnyView(
                        Button("Group \(id)") {
                            if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
                                UIApplication.shared.open(url)
                            }
                            print("Tapped group button with ID \(id)")
                        }
                        .accessibilityIdentifier("\(id)")
                        .buttonStyle(.bordered)
                    )
                }

                let hStack = AnyView(
                    HStack {
                        ForEach(0..<buttons.count, id: \.self) { index in
                            buttons[index]
                        }
                    }
                )

                let groupId = addDynamicNode(hStack)
                print("Added group button HStack with base ID \(groupId)")
            }
        }
        .buttonStyle(.borderedProminent)
    }
}
