import SwiftUI

struct ContentView: View {
    @State private var dynamicNodes: [Node] = []
    @State private var currentId = 0
    @State private var searchId: String = ""
    @State private var foundNode: Node? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Top-aligned paragraph
                    Text("""
                    Thank you Patti Hoa for interviewing me today! I reattempted the question in Swift with recursive DFS. Please feel free to give the application a try by inputting an ID as an integer, and clicking on the search button. Next, add new buttons to test the program with dynamic UI. Click on the dynamic buttons to see my GitHub webpage. Thank you so much for your time!
                    """)
                    .padding(.top)

                    // Search section
                    HStack {
                        TextField("Enter ID as an int to search", text: $searchId)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Button("Search") {
                            if let id = Int(searchId) {
                                if let node = UIElementFinder.find(node: dynamicNodes, targetId: id) {
                                    foundNode = node
                                    print("Found node with ID \(id): \(node.id)")
                                } else {
                                    foundNode = nil
                                    print("Node with ID \(id) not found")
                                }
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    // Search result
                    if let node = foundNode {
                        Text("Found Node with ID \(node.id)")
                    } else {
                        Text("No Node found with the given ID.")
                    }

                    // Add buttons
                    HStack {
                        Button("Add New Button") {
                            let id = addDynamicNode(view: AnyView(
                                Button("Dynamic Button \(currentId)") {}.buttonStyle(.bordered)
                            ))
                            print("Added dynamic button with ID \(id)")
                        }

                        Button("Add Button Group") {
                                
                            for _ in 0..<3 {
                                let id = currentId
                                let button = AnyView(
                                    Button("Group Button \(id)") {
                                        if let url = URL(string:"https://debbieyuen.github.io/heyapple/") {
                                            UIApplication.shared.open(url)}
                                        
                                        print("Tapped group button with ID \(id)")
                                    }
                                    .accessibilityIdentifier("\(id)")
                                    .buttonStyle(.bordered)
                                )
                                let addedId = addDynamicNode(view: button)
                                print("Added group button with ID \(addedId)")
                            }
                        }
                    }.buttonStyle(.borderedProminent)

                    // Render all dynamic nodes
                    ForEach(dynamicNodes, id: \.id) { node in
                        node.view
                            .accessibilityIdentifier("\(node.id)")
                    }

                    Spacer(minLength: 40)
                }
                .padding()
            }
            .navigationTitle("Dynamic UI with DFS")
        }
    }

    // MARK: - Helpers

    func addDynamicNode(view: AnyView) -> Int {
        let id = currentId
        dynamicNodes.append(Node(id: id, view: view))
        currentId += 1
        return id
    }
}

