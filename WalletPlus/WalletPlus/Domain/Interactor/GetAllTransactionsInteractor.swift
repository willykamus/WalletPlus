//
//  GetAllTransactionsInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-01.
//

import Foundation

protocol GetAllTransactionsInteractor {
    func execute(completed: @escaping (Result<[Transaction], Error>) -> Void)
}

class GetAllTransactionsInteractorImpl: GetAllTransactionsInteractor {
    
    var repository: TransactionsRepository = TransactionsRepositoryImpl()
    
    func execute(completed: @escaping (Result<[Transaction], Error>) -> Void) {
        repository.getAllTransactions { result in
            completed(result)
        }
    }
}
