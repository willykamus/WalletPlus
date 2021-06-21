//
//  TransactionsListTab.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-04.
//

import SwiftUI

struct TransactionsListTab: View {
    
    var body: some View {
        NavigationView {
            TransactionsListView()
            .navigationBarTitle(Text("Transactions"))
        }
    }
}

struct TransactionsListTab_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListTab()
    }
}
