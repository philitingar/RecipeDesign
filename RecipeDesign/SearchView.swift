//
//  SearchView.swift
//  RecipeDesign
//
//  Created by Timi on 4/11/22.
//
import CoreData
import SwiftUI

struct SearchView: View {
    let searchObjects = [ "diet", "occasion", "type" ]
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [])
    private var recipes: FetchedResults<Recipe>
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes, id: \.self) { recipe in
                    NavigationLink(destination: Text(recipe.title!)) {
                        Text(recipe.title!)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .onChange(of: searchText, perform: { newValue in
                recipes.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "title BEGINSWITH %@", newValue)
            })
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

