////
////  AddButtonsView.swift
////  findingnodes
////
////  Created by Debbie Yuen on 4/24/25.
////
//
//
//import SwiftUI
//
//struct AddButtonsView: View {
//    @Binding var currentId: Int
//    var getNextId: () -> Int
//    var addDynamicNode: (AnyView) -> Int
//
//    var body: some View {
//        HStack {
//            Button("Add New Button") {
//                let id = addDynamicNode(AnyView(
//                    Button("Dynamic Button \(currentId)") {
//                        if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
//                            UIApplication.shared.open(url)
//                        }
//                    }
//                        .buttonStyle(.bordered)
//                ))
//                print("Added dynamic button with ID \(id)")
//            }
//
//            Button("Add Button Group") {
//                let groupStartId = currentId
//                let buttons = (0..<4).map { offset in
//                    let id = groupStartId + offset
//                    return AnyView(
//                        Button("Group \(id)") {
//                            if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
//                                UIApplication.shared.open(url)
//                            }
//                            print("Tapped group button with ID \(id)")
//                        }
//                        .accessibilityIdentifier("\(id)")
//                        .buttonStyle(.bordered)
//                    )
//                }
//
//                let hStack = AnyView(
//                    HStack {
//                        ForEach(0..<buttons.count, id: \.self) { index in
//                            buttons[index]
//                        }
//                    }
//                )
//
//                let groupId = addDynamicNode(hStack)
//                print("Added group button HStack with base ID \(groupId)")
//            }
//        }
//        .buttonStyle(.borderedProminent)
//    }
//}

//import SwiftUI
//
//struct AddButtonsView: View {
//    var getNextId: () -> Int
//    var addDynamicNode: (AnyView) -> Int
//
//    var body: some View {
//        HStack(spacing: 16) {
//            Button("Add New Button") {
//                let id = getNextId()
//                let view = AnyView(
//                    Button("Dynamic Button \(id)") {
//                        if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
//                            UIApplication.shared.open(url)
//                        }
//                    }
//                    .buttonStyle(.bordered)
//                    .accessibilityIdentifier("node_\(id)")
//                )
//                addDynamicNode(view)
//                print("Added dynamic button with ID \(id)")
//            }
//
//            Button("Add Button Group") {
//                let buttons: [AnyView] = (0..<4).map { _ in
//                    let id = getNextId()
//                    return AnyView(
//                        Button("Group \(id)") {
//                            if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
//                                UIApplication.shared.open(url)
//                            }
//                            print("Tapped group button with ID \(id)")
//                        }
//                        .accessibilityIdentifier("group_\(id)")
//                        .buttonStyle(.bordered)
//                    )
//                }
//
//                let hStack = AnyView(
//                    HStack(spacing: 8) {
//                        ForEach(0..<buttons.count, id: \.self) { index in
//                            buttons[index]
//                        }
//                    }
//                )
//
//                let groupId = addDynamicNode(hStack)
//                print("Added group HStack node with base ID \(groupId)")
//            }
//        }
//        .padding(.vertical, 8)
//        .buttonStyle(.borderedProminent)
//    }
//}

//import SwiftUI
//
//struct AddButtonsView: View {
//    var getNextId: () -> Int
//    var addDynamicNode: (AnyView) -> Int
//    var addGroupWithButtons: () -> Int
//
//    var body: some View {
//        HStack(spacing: 16) {
//            Button("Add New Button") {
//                let id = getNextId()
//                let view = AnyView(
//                    Button("Dynamic Button \(id)") {
//                        if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
//                            UIApplication.shared.open(url)
//                        }
//                    }
//                    .buttonStyle(.bordered)
//                    .accessibilityIdentifier("node_\(id)")
//                )
//                let addedId = addDynamicNode(view)
//                print("Added dynamic button with ID \(addedId)")
//            }
//
//            Button("Add Button Group") {
//                let groupId = addGroupWithButtons()
//                print("Added group HStack node with ID \(groupId) and 4 button children")
//            }
//        }
//        .padding(.vertical, 8)
//        .buttonStyle(.borderedProminent)
//    }
//}

//import SwiftUI
//
//struct AddButtonsView: View {
//    var addDynamicNode: (AnyView) -> Int
//    var addGroupWithButtons: () -> Int
//
//    var body: some View {
//        HStack(spacing: 16) {
//            Button("Add New Button") {
//                let view = AnyView(
//                    Button("Dynamic Button") {
//                        if let url = URL(string: "https://debbieyuen.github.io/heyapple/") {
//                            UIApplication.shared.open(url)
//                        }
//                    }
//                    .buttonStyle(.bordered)
//                )
//                let id = addDynamicNode(view)
//                print("Added dynamic button with ID \(id)")
//            }
//
//            Button("Add Button Group") {
//                let groupId = addGroupWithButtons()
//                print("Added group HStack node with ID \(groupId) and 4 button children")
//            }
//        }
//        .padding(.vertical, 8)
//        .buttonStyle(.borderedProminent)
//    }
//}

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
