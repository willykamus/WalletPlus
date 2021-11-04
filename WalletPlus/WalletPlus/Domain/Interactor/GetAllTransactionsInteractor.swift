//
//  GetAllTransactionsInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-01.
//

import Foundation

protocol GetAllTransactionsInteractor {
    func execute() async -> [Transaction]
}

class GetAllTransactionsInteractorImpl: GetAllTransactionsInteractor {
    
    var repository: TransactionsRepository = TransactionsRepositoryImpl()
    
    func execute() async -> [Transaction] {
        return await repository.getAllTransactions()
    }
}
