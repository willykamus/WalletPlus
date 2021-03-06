//
//  Transaction.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

struct Transaction: Identifiable, Hashable {
    var id: String
    var amount: Double
    var category: String
    var date: Date
    var containerId: String
}
