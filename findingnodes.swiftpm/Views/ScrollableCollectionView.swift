//
//  ScrollableCollectionView.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//

import Foundation
import SwiftUI

struct ScrollableCollectionView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Collection Item 1")
                Text("Collection Item 2")
                Text("Collection Item 3")
            }
        }
    }
}
