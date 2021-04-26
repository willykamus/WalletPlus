//
//  DisplayableGroup.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-24.
//

import Foundation

struct DisplayableCategory: Identifiable {
    var id: UUID = UUID()
    var name: String
    var amount: String
    var numberOfTransactions: String
}
