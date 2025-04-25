//
//  DynamicNodeHelper.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//


//import SwiftUI
//
//class DynamicNodeHelper: ObservableObject {
//    @Published var dynamicNodes: [Node] = []
//    @Published var currentId: Int = 0
//
//    func add(view: AnyView) -> Int {
//        let id = currentId
//        dynamicNodes.append(Node(id: id, view: view))
//        currentId += 1
//        return id
//    }
//    
//    func getNextID() -> Int {
//        return currentId
//    }
//}

//import SwiftUI
//
//class DynamicNodeHelper: ObservableObject {
//    @Published var dynamicNodes: [Node] = []
//    @Published private(set) var currentId: Int = 0
//
//    func add(view: AnyView) -> Int {
//        let id = currentId
//        dynamicNodes.append(Node(id: id, view: view))
//        currentId += 1
//        return id
//    }
//
//    func getNextID() -> Int {
//        let id = currentId
//        currentId += 1
//        return id
//    }
//
//    func addGroupWithButtons(buttonCount: Int = 4, url: String) -> Int {
//        var buttonNodes: [Node] = []
//
//        for _ in 0..<buttonCount {
//            let id = getNextID()
//            let view = AnyView(
//                Button("Group \(id)") {
//                    if let link = URL(string: url) {
//                        UIApplication.shared.open(link)
//                    }
//                    print("Tapped group button with ID \(id)")
//                }
//                .accessibilityIdentifier("group_\(id)")
//                
//            )
//            let node = Node(id: id, view: view)
//            buttonNodes.append(node)
//        }
//
//        // Now create the HStack view using these buttons
//        let groupView = AnyView(
//            HStack(spacing: 8) {
//                ForEach(buttonNodes, id: \.id) { node in
//                    node.view
//                }
//            }
//        )
//
//        // Add the group as a parent node, optionally with the buttonNodes as children
//        let groupId = getNextID()
//        dynamicNodes.append(Node(id: groupId, view: groupView, children: buttonNodes))
//
//        return groupId
//    }
//}

import SwiftUI

@MainActor
class DynamicNodeHelper: ObservableObject {
    @Published var dynamicNodes: [Node] = []
    @Published private(set) var currentId: Int = 0

    func add(buildViewWithId: (Int) -> AnyView) -> Int {
        let id = currentId
        let view = buildViewWithId(id)
        dynamicNodes.append(Node(id: id, view: view))
        currentId += 1
        return id
    }

    func addGroupWithButtons(buttonCount: Int = 4, url: String) -> Int {
        var buttonNodes: [Node] = []

        for _ in 0..<buttonCount {
            let id = getNextID()
            let view = AnyView(
                Button("Group \(id)") {
                    if let link = URL(string: url) {
                        UIApplication.shared.open(link)
                    }
                    print("Tapped group button with ID \(id)")
                }
                .buttonStyle(.bordered)
                .accessibilityIdentifier("group_\(id)")
                
            )
            let node = Node(id: id, view: view)
            buttonNodes.append(node)
        }

        let groupView = AnyView(
            HStack(spacing: 8) {
                ForEach(buttonNodes, id: \.id) { node in
                    node.view
                }
            }
        )

        let groupId = getNextID()
        dynamicNodes.append(Node(id: groupId, view: groupView, children: buttonNodes))

        return groupId
    }

    private func getNextID() -> Int {
        let id = currentId
        currentId += 1
        return id
    }
}
