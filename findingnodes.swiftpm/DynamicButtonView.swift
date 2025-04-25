//
//  File.swift
//  findingnodes
//
//  Created by Debbie Yuen on 4/24/25.
//

import Foundation
import SwiftUI

struct DynamicButtonView: View {
    var addNode: (AnyView) -> Void
    var currentId: Int
    var count: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(0..<count, id: \.self) { index in
                let id = currentId + index
                let button = AnyView(
                    Button("Group Button \(id)") {
                        print("Tapped button with ID \(id)")
                    }
                    .accessibilityIdentifier("\(id)")
                )

                button
                    .onAppear {
                        addNode(button)
                    }
            }
        }
        .padding()
    }
}

