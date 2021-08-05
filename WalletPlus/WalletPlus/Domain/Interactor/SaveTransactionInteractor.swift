//
//  AddTransactionInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol SaveTransactionInteractor {
    func execute(transaction: Transaction, in container: TransactionsContainer, completion: @escaping (Bool) -> Void)
}

class SaveTransactionInteractorImpl: SaveTransactionInteractor {
    
    var dataSource: TransactionRemoteDataSource
    
    init(dataSource: TransactionRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    func execute(transaction: Transaction, in container: TransactionsContainer, completion: @escaping (Bool) -> Void) {
        
        let entity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        
        dataSource.add(transaction: entity, to: container) { result in
            completion(result)
        }
    }
    
    
}
