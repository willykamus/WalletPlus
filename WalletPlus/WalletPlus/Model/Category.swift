//
//  Category.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation

struct Category: Identifiable, Hashable {
    var id: String
    var type: TransactionType
    var name: String
}

