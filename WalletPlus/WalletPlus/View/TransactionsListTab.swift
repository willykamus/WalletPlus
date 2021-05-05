//
//  TransactionsListTab.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-04.
//

import SwiftUI

struct TransactionsListTab: View {
    
    @StateObject var viewModel: TransactionViewModel = TransactionViewModel()
    
    var body: some View {
        NavigationView {
            TransactionsListView(viewModel: self.viewModel)
            .navigationBarTitle(Text("Transactions"))
        }
    }
}

struct TransactionsListTab_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListTab()
    }
}