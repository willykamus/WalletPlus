//
//  GetCategory.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-25.
//

import Foundation

protocol GetCategory {
    func getCategory(from transactions: [Transaction]) -> [Category]
}

class CategoryInteractor: GetCategory {
    
    func getCategory(from transactions: [Transaction]) -> [Category] {
        var unique: [String] = []
        for transaction in transactions {
            if !unique.contains(transaction.category) {
                unique.append(transaction.category)
            }
        }
        var groups: [Category] = []
        for category in unique {
            var group: Category = Category(name: category)
            for transaction in transactions {
                if transaction.category == category {
                    group.transactions.append(transaction)
                }
            }
            groups.append(group)
        }
        return groups
    }
    
    
}
