//
//  GetExpenseTransactionsFromContainerInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-07.
//

import Foundation

protocol GetExpenseTransactionsFromContainerInteractor {
    func execute(container: TransactionsContainer) -> [Transaction]
}

class GetExpenseTransactionsFromContainerInteractorImpl: GetExpenseTransactionsFromContainerInteractor {
    func execute(container: TransactionsContainer) -> [Transaction] {
        if let transactions = container.transactions {
            return transactions.filter { $0.amount < 0.0}
        } else {
            return []
        }
    }
    
    
}
