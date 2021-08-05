//
//  DeleteTransactionInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-08-02.
//

import Foundation

protocol DeleteTransactionInteractor {
    func execute(transaction: Transaction, completed: @escaping (Result<Bool, Error>) -> Void)
}

class DeleteTransactionInteractorImpl: DeleteTransactionInteractor {
    
    var repository: TransactionsRepository = TransactionsRepositoryImpl()
    
    func execute(transaction: Transaction, completed: @escaping (Result<Bool, Error>) -> Void) {
        repository.delete(transaction: transaction) { result in
            completed(result)
        }
    }
}
