//
//  Wallet.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

struct TransactionsContainer: Identifiable, Hashable {
    static func == (lhs: TransactionsContainer, rhs: TransactionsContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    var id: String
    var transactions: [Transaction]?
    var name: String
    
    func currentAmount() -> Double {
        var amount: Double = 0
        if transactions?.count ?? 0 > 0 {
            for transaction in transactions! {
                amount += transaction.amount
            }
            return amount
        }
        return 0.0
    }
}
