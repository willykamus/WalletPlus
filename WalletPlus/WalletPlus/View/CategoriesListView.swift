//
//  CategoriesListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-12.
//

import SwiftUI

struct CategoriesListView: View {
    
    var viewModel: CategoriesListViewModel = CategoriesListViewModel()
    @State var selectedType: Int = 1
    @Binding var selectedCategory: Category?
    @Binding var categoriesPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Picker(selection: self.$selectedType, label: Text("Picker"), content: {
                    Text("Income").tag(1)
                    Text("Expense").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
            }
            
            if selectedType == 1 {
                List(viewModel.incomeCategories, id: \.id) { category in
                    Button(action: {
                        self.selectedCategory = category
                        self.categoriesPresented.toggle()
                    }, label: {
                        Text(category.name)
                    })
                }
            } else {
                List(viewModel.expenseCategories, id: \.id) { category in
                    Button(action: {
                        self.selectedCategory = category
                        self.categoriesPresented.toggle()
                    }, label: {
                        Text(category.name)
                    })
                }
            }
        }.padding(.top, 16)
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView(selectedCategory: .constant(Category(id: "1", type: .expense, name: "Cash")), categoriesPresented: .constant(true))
    }
}
