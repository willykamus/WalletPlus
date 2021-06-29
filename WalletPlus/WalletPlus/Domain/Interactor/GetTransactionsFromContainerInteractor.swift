//
//  GetTransactionsFromContainerInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-29.
//

import Foundation

protocol GetTransactionsFromContainerInteractor {
    func execute(for container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void)
}

class GetTransactionsFromContainerInteractorImpl: GetTransactionsFromContainerInteractor {
    
    var repository: TransactionsRepository = TransactionsRepositoryImpl()
    
    func execute(for container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void) {
        repository.getTransactions(from: container) { result in
            completed(result)
        }
    }
    
    
}
