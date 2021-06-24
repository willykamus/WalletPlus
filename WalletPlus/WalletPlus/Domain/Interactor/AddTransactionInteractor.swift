//
//  AddTransactionInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol AddTransactionInteractor {
    func execute(transaction: Transaction, containerID: String, completion: @escaping (Bool) -> Void)
}

class AddTransactionInteractorImpl: AddTransactionInteractor {
    
    var dataSource: TransactionRemoteDataSoutce
    
    init(dataSource: TransactionRemoteDataSoutce) {
        self.dataSource = dataSource
    }
    
    func execute(transaction: Transaction, containerID: String, completion: @escaping (Bool) -> Void) {
        
        let entity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        
        dataSource.add(transaction: entity, to: containerID) { result in
            completion(result)
        }
    }
    
    
}
