//
//  WalletRowView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-31.
//

import SwiftUI

struct WalletRowView: View {
    
    @State var container: TransactionsContainer
    
    var body: some View {
        HStack(spacing:0) {
            Image(systemName: "bag.fill.badge.plus")
                .font(.largeTitle)
                .padding()
            VStack(alignment: .leading) {
                Text(container.name)
                Text("\(container.transactions?.count ?? 0) Transactions")
            }
            
            Spacer()
        }
    }
}

struct WalletRowView_Previews: PreviewProvider {
    static var previews: some View {
        WalletRowView(container: TransactionsContainer(id: "123", transactions: [], name: "Hello World"))
    }
}
