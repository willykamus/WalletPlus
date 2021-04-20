//
//  Transaction.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

protocol Transaction {
    var remoteId: String { get set }
    var amount: Double { get set }
    var category: String { get set }
    var date: Date { get set }
}
