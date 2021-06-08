//
//  GetTransactionsInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-07.
//

import Foundation

enum TransactionContainerError: Error {
    case emptyContainers
    case emptyCategories
    case emptyTransactions
}

protocol GetTransactionsInteractor {
    func execute(containers: [TransactionsContainer]) -> Result<[Transaction], TransactionContainerError>
}

class GetTransactionsInteractorImpl: GetTransactionsInteractor {
    func execute(containers: [TransactionsContainer]) -> Result<[Transaction], TransactionContainerError> {
        var transactions: [Transaction] = []
        for container in containers {
            if let transactionsInContainer = container.transactions {
                transactions.append(contentsOf: transactionsInContainer)
            }
        }
        
        if transactions.count > 0 {
            return .success(transactions)
        } else {
            return .failure(.emptyContainers)
        }
    }
}
