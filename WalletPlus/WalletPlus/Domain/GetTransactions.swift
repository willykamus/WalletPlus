//
//  GetTransactions.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-28.
//

import Foundation

protocol GetTransactions {
    func getTransactions(from containers: [TransactionContainer]) -> [Transaction]
}

class GetTransactionsInteractor: GetTransactions {
    
    func getTransactions(from containers: [TransactionContainer]) -> [Transaction] {
        var allTransactions: [Transaction] = []
        for container in containers {
            for transaction in container.transactions {
                allTransactions.append(transaction)
            }
        }
        return allTransactions.sorted { $0.date < $1.date}
    }
    
    
}
