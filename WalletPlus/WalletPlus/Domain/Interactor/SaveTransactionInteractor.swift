//
//  AddTransactionInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol SaveTransactionInteractor {
    func execute(transaction: Transaction, in container: TransactionsContainer) async -> Bool
}

class SaveTransactionInteractorImpl: SaveTransactionInteractor {
    
    var repository: TransactionsRepository
    
    init(repository: TransactionsRepository) {
        self.repository = repository
    }
    
    func execute(transaction: Transaction, in container: TransactionsContainer) async -> Bool {
        return await self.repository.add(transaction: transaction, to: container)
    }
}
