//
//  TransactionsListTab.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-04.
//

import SwiftUI

struct TransactionsListTab: View {
    
    @StateObject var viewModel: TransactionsViewModel = TransactionsViewModel()
    
    var body: some View {
        NavigationView {
            TransactionsListView().environmentObject(viewModel)
            .navigationBarTitle(Text("Transactions"))
        }
    }
}

struct TransactionsListTab_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListTab()
    }
}
