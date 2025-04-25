//
//  DynamicNodeHelper.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//


import SwiftUI

class DynamicNodeHelper: ObservableObject {
    @Published var dynamicNodes: [Node] = []
    @Published var currentId: Int = 0

    func add(view: AnyView) -> Int {
        let id = currentId
        dynamicNodes.append(Node(id: id, view: view))
        currentId += 1
        return id
    }
}
