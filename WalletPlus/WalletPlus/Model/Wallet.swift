//
//  Wallet.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

protocol TransactionContainer {
    var transactions: [Transaction]? { get set }
    var name: String { get set }
    func currentAmount() -> Double
}

class Wallet: TransactionContainer {

    var transactions: [Transaction]?
    var name: String
    
    init(name: String) {
        self.name = name
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
