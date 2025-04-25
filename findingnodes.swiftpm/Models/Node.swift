//
//  Node.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//
import Foundation
import SwiftUI

// Node structure to represent each UI element
struct Node {
    let id: Int
    let view: AnyView
    var children: [Node] = []
}
