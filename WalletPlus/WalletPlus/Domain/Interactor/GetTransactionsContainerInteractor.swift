//
//  GetTransactionsContainerInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-03.
//

import Foundation

protocol GetTransactionsContainerInteractor {
    func execute() async -> [TransactionsContainer]
}

class GetTransactionsContainerInteractorImpl: GetTransactionsContainerInteractor {

    let repository: TransactionsContainerRepository = TransactionsContainerRepositoryImpl()

    func execute() async -> [TransactionsContainer] {
        return await repository.initialize()
    }
    
}
