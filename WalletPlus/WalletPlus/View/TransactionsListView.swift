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
