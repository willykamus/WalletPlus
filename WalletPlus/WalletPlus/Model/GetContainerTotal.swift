//
//  GetContainerTotal.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-26.
//

import Foundation

protocol GetContainerAmount {
    func getContainerTotalAmount(from container: TransactionsContainer) -> Double
}

class ContainerInteractor: GetContainerAmount {
    
    func getContainerTotalAmount(from container: TransactionsContainer) -> Double {
        if let transactions = container.transactions {
            let total = transactions.reduce(0) { $0 + $1.amount}
            return total
        }
        return 0.0
    }
    
}
