//
//  File.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//

import SwiftUI

class UIElementFinder {
    static func find(node: [Node], targetId: Int) -> Node? {
        for n in node {
            if n.id == targetId {
                return n
            }
            if let found = find(node: n.children, targetId: targetId) {
                return found
            }
        }
        return nil
    }
}

