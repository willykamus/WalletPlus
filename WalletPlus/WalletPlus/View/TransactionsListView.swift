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
    @StateObject var viewModel: TransactionsViewModel = TransactionsViewModel()
    
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
            ZStack {
                if viewModel.displayNoTransactionMessage {
                    Text("No transactions")
                } else {
                    List {
                        ForEach(viewModel.transactionListSection) { section in
                            Section(header: Text(section.date)) {
                                ForEach(section.transactions) { transaction in
                                    TransactionRow(transaction: transaction).contextMenu(menuItems: {
                                        Button(action: {
                                            Task.init {
                                                await self.viewModel.delete(transaction: transaction)
                                            }
                                        }, label: {
                                            Label(
                                                title: { Text("Delete") },
                                                icon: { Image(systemName: "trash") })
                                        })
                                    })
                                }
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .listStyle(.plain)
                    .toolbar(content: {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                self.trailingButton
                            }
                    })
                }
                
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
            .navigationBarTitle(Text("Transactions"))
            .onAppear(perform: {
                if container != nil {
                    self.viewModel.selectedContainer = container!
                }
                Task.init {
                    await self.viewModel.initialize()
                }
            })
            .sheet(isPresented: self.$createTransaction, onDismiss: {
                Task.init {
                    await self.viewModel.initialize()
                }
            }, content: {
                CreateTransactionView(createTransactionOpened: self.$createTransaction, selectedContainer: self.container)
            })
        }

}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
