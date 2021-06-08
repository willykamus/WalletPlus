//
//  TransactionsListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI

struct TransactionsListView: View {
    
    var container: TransactionsContainer?
    
    @State var createTransaction: Bool = false
    
    @EnvironmentObject var viewModel: TransactionsViewModel
    
    var trailingButton: some View {
        HStack {
            if self.container != nil {
                NavigationLink(
                    destination: TransactionContainerOverview(container: self.container!),
                    label: {
                        Text("Overview")
                    })
            } else {
                EmptyView()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.transactionListSection) { section in
                        Section(header: TransactionSectionView(text: section.date)) {
                            ForEach(section.transactions, id: \.id) { transaction in
                                TransactionRow(transaction: transaction)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle(Text("Transactions"))
                .toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            self.trailingButton
                        }
                })
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.createTransaction.toggle()
                        }, label: {
                            FloatingButton()
                        })
                    }
                    .padding(.bottom,20)
                    .padding(.horizontal,20)
                    
                }
            }
        }
        .sheet(isPresented: self.$createTransaction, onDismiss: {
            print("Not here")
        }, content: {
            NavigationView {
                CreateTransactionView(currentContainer: self.container)
            }
        })
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
