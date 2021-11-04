//
//  TransactionsRepository.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-29.
//

import Foundation

protocol TransactionsRepository {
    func getTransactions(from container: TransactionsContainer) async -> [Transaction]
    func getAllTransactions() async -> [Transaction]
    func delete(transaction: Transaction)
    func add(transaction: Transaction, to container: TransactionsContainer) async -> Bool
}

class TransactionsRepositoryImpl: TransactionsRepository {

    var remoteDataSource: TransactionRemoteDataSource = TransactionRemoteDataSourceImpl()
    
    func getAllTransactions() async -> [Transaction] {
        return await remoteDataSource.getAllTransactions()
    }
    
    func getTransactions(from container: TransactionsContainer) async -> [Transaction] {
        return await self.remoteDataSource.getTransactions(container: container)
    }
    
    func delete(transaction: Transaction) {
        let remoteEntity: TransactionRemoteEntity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        self.remoteDataSource.delete(transaction: remoteEntity)
    }
    
    func add(transaction: Transaction, to container: TransactionsContainer) async -> Bool {
        let entity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        return await self.remoteDataSource.add(transaction: entity, to: container)
    }
}
