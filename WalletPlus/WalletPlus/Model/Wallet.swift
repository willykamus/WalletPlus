//
//  Wallet.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

protocol TransactionContainer {
    var id: String { get set }
    var transactions: [Transaction]? { get set }
    var name: String { get set }
    func currentAmount() -> Double
}

class Wallet: TransactionContainer {
    var id: String = UUID().uuidString
    var transactions: [Transaction]?
    var name: String
    
    init(name: String, transactions: [Transaction]? = nil) {
        self.name = name
        self.transactions = transactions
    }
    
    func currentAmount() -> Double {
        var amount: Double = 0
        if let transactions = self.transactions {
            for transaction in transactions {
                amount += transaction.amount
            }
        }
        return amount
    }
}
