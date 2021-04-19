//
//  Transaction.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

protocol Transaction {
    var id: String { get set }
    var amount: Double { get set }
    var group: String { get set }
}
