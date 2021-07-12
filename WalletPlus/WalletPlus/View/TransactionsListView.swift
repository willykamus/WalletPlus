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
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 20) {
                        ForEach(viewModel.transactionListSection) { section in
                            TransactionsSection(content: section).padding(.horizontal, 16)
                        }
                    }.padding(.vertical, 16)
                })
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
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableView.appearance().separatorStyle = .none
                if container != nil {
                    self.viewModel.selectedContainer = container!
                }
                self.viewModel.initialize()
            })
            .sheet(isPresented: self.$createTransaction, onDismiss: {
                viewModel.initialize()
            }, content: {
                CreateTransactionView(createTransactionOpened: self.$createTransaction, currentContainer: self.container)
            })
        }

}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
