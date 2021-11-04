//
//  GetTransactionsFromContainerInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-29.
//

import Foundation

protocol GetTransactionsFromContainerInteractor {
    func execute(for container: TransactionsContainer) async -> [Transaction]
}

class GetTransactionsFromContainerInteractorImpl: GetTransactionsFromContainerInteractor {
    
    var repository: TransactionsRepository = TransactionsRepositoryImpl()
    
    func execute(for container: TransactionsContainer) async -> [Transaction] {
        return await repository.getTransactions(from: container)
    }
}
