//
//  TransactionView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI

struct TransactionView: View {
    
    @StateObject var viewModel: TransactionViewModel = TransactionViewModel()
    
    var body: some View {
        NavigationView {
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
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
