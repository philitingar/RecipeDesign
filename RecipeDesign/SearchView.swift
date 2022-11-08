//
//  SearchView.swift
//  RecipeDesign
//
//  Created by Timi on 4/11/22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
                    Text("Searching for \(searchText)")
                        .searchable(text: $searchText, prompt: "Look for something")
                        .navigationTitle("Search here!")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    dismiss()
                                } label: {
                                    Label("Back", systemImage: "xmark")
                                }
                            }
                        }
            
                }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
