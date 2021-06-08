//
//  GetTransactionsCategoriesInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-07.
//

import Foundation

protocol GetTransactionsCategoriesInteractor {
    func execute(containers: [TransactionsContainer]) -> [Category]
}

class GetTransactionsCategoriesInteractorImpl: GetTransactionsCategoriesInteractor {
    func execute(containers: [TransactionsContainer]) -> [Category] {
        var unique: [String] = []
        for container in containers {
            if let transactions = container.transactions {
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
            } else {
                return []
            }
        }
        return []
    }
    
    
}
