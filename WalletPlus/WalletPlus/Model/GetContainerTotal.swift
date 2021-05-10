//
//  GetContainerTotal.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-26.
//

import Foundation

protocol GetContainerAmount {
    func getContainerTotalAmount(from container: TransactionContainer) -> Double
}

class ContainerInteractor: GetContainerAmount {
    
    func getContainerTotalAmount(from container: TransactionContainer) -> Double {
        let total = container.transactions.reduce(0) { $0 + $1.amount}
        return total ?? 0.0
    }
    
}
