//
//  CreateTransactionsContainerInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-11-04.
//

import Foundation

protocol CreateTransactionsContainerInteractor {
    func execute(containerName: String, startingAmount: String) -> Bool
}

class CreateTransactionsContainerInteractorImpl: CreateTransactionsContainerInteractor {
    
    let repository: TransactionsContainerRepository = TransactionsContainerRepositoryImpl()
    
    func execute(containerName: String, startingAmount: String) -> Bool {
        let container = TransactionsContainer(id: UUID().uuidString, transactions: [], name: containerName)
        return repository.createContainer(containerName: container)
    }
    
    
}
