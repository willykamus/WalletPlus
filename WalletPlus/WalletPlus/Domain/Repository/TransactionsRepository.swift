//
//  TransactionsRepository.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-29.
//

import Foundation

protocol TransactionsRepository {
    func getTransactions(from container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void)
    func getAllTransactions(completed: @escaping (Result<[Transaction], Error>) -> Void)
    func delete(transaction: Transaction, completed: @escaping (Result<Bool,Error>) -> Void)
}

class TransactionsRepositoryImpl: TransactionsRepository {

    var remoteDataSource: TransactionRemoteDataSource = TransactionRemoteDataSourceImpl()
    
    func getAllTransactions(completed: @escaping (Result<[Transaction], Error>) -> Void) {
        self.remoteDataSource.getAllTransactions { result in
            completed(result)
        }
    }
    
    func getTransactions(from container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void) {
        self.remoteDataSource.getTransactions(container: container) { result in
            completed(result)
        }
    }
    
    func delete(transaction: Transaction, completed: @escaping (Result<Bool, Error>) -> Void) {
        let remoteEntity: TransactionRemoteEntity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        self.remoteDataSource.delete(transaction: remoteEntity) { result in
            completed(result)
        }
    }
}
