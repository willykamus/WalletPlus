//
//  TransactionsSection.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-02.
//

import SwiftUI

struct TransactionsSection: View {
    
    var content: TransactionListSection
    var body: some View {
        VStack(alignment: .leading) {
            Text(content.date).font(.callout).padding(.horizontal, 16).foregroundColor(.gray)
            VStack(alignment: .leading) {
                ForEach(content.transactions, id: \.id) { transaction in
                    TransactionRow(transaction: transaction).padding(.top,2)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal,16)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.1), radius: 4, x: 0, y: 0)
        }
    }
}

struct TransactionsSection_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsSection(content: TransactionListSection(date: "10-10-2000", transactions: [Transaction(id: "1", amount: 100.0, category: "None", date: Date(), containerId: "123"), Transaction(id: "1", amount: 100.0, category: "None", date: Date(), containerId: "123")])).previewLayout(.sizeThatFits)
    }
}
