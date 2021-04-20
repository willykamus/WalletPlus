//
//  TransactionView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI

struct TransactionView: View {
    
    var transactions: [Transaction] = [IncomeTransaction(date: Date(), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(date: Date(), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(date: Date(), remoteId: "3", amount: -33.2, category: "Car")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(transactions, id: \.remoteId) { transaction in TransactionRow(transaction: transaction)
                }
            }
            .navigationBarTitle(Text("Transactions"))
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(transactions: [IncomeTransaction(date: Date(), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(date: Date(), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(date: Date(), remoteId: "3", amount: -33.2, category: "Car")])
    }
}
