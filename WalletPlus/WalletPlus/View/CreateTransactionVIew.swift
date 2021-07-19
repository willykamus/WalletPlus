//
//  CreateTransactionVIew.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-12.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @Binding var createTransactionOpened: Bool
    @State var currentContainer: TransactionsContainer?
    @State var selectedContainer: TransactionsContainer?
    @State var selectedCategory: Category?
    @State var amount: String = ""
    @State var description: String = ""
    @State var containersPresented: Bool = false
    @State var categoriesPresented: Bool = false
    @ObservedObject var viewModel = CreateTransactionViewModel()
    
    var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("Transaction Amount")) {
                        TextField("Amount", text: $amount)
                    }
                    
                    Section(header: Text("Wallet")) {
                        NavigationLink(
                            destination: AvailableContainersListView(selectedContainer: self.$selectedContainer, containerListPresented: self.$containersPresented),
                            isActive: self.$containersPresented,
                            label: {
                                HStack {
                                    Text("Wallet")
                                    Spacer()
                                    if currentContainer != nil {
                                        Text(self.currentContainer?.name ?? "").foregroundColor(.gray)
                                    } else {
                                        Text(self.selectedContainer?.name ?? "").foregroundColor(.gray)
                                    }
                                }
                            })
                    }
                    
                    Section(header: Text("Category")) {
                        NavigationLink(
                            destination: CategoriesListView(selectedCategory: self.$selectedCategory, categoriesPresented: self.$categoriesPresented).navigationBarTitleDisplayMode(.inline),
                            isActive: self.$categoriesPresented,
                            label: {
                                HStack {
                                    Text("Category")
                                    Spacer()
                                    Text(self.selectedCategory?.name ?? "").foregroundColor(.gray)
                                }
                                
                            })
                    }

                    Section(header: Text("Transaction Note")) {
                        TextField("Note", text: $description)
                    }
                    
                    Button(action: {
                        print("Hello world")
                    }, label: {
                        Text("Save")
                    })
                }
                .navigationTitle("Create Transaction")
            }
    }
}

struct CreateTransactionVIew_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView(createTransactionOpened: .constant(true))
    }
}
