//
//  DeleteTransactionInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-08-02.
//

import Foundation

protocol DeleteTransactionInteractor {
    func execute(transaction: Transaction)
}

class DeleteTransactionInteractorImpl: DeleteTransactionInteractor {
    
    var repository: TransactionsRepository = TransactionsRepositoryImpl()
    
    func execute(transaction: Transaction) {
        repository.delete(transaction: transaction)
    }
}
