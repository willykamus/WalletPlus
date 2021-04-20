//
//  ExpenseTransaction.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

struct ExpenseTransaction: Transaction {
    var date: Date
    
    var remoteId: String
    var amount: Double
    var category: String
}
