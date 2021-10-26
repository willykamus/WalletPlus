//
//  MoreTabView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-09-03.
//

import SwiftUI

struct MoreTabView: View {
    
    @State var displayCategories: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: CategoriesListView(selectedCategory: Binding.constant(nil), categoriesPresented: self.$displayCategories)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "plus")
                        }
                    }),
                isActive: self.$displayCategories,
                label: {
                    Text("Categories")
                })
                .navigationBarTitle(Text("More"), displayMode: .inline)
        }
    }
}

struct MoreTabView_Previews: PreviewProvider {
    static var previews: some View {
        MoreTabView()
    }
}
