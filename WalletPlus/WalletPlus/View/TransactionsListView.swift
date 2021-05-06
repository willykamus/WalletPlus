//
//  TransactionsListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI

struct TransactionsListView: View {
    
    var container: TransactionContainer?
    
    @ObservedObject var viewModel: TransactionViewModel = TransactionViewModel()
    
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
        List {
            ForEach(viewModel.transactionListSection) { section in
                Section(header: TransactionSectionView(text: section.date)) {
                    ForEach(section.transactions, id: \.remoteId) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Transactions"))
        .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    self.trailingButton
                }
        })
        .onAppear(perform: {
            self.viewModel.getTransactions(from: self.container)
        })
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
