//
//  TransactionsContainerRepository.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-24.
//

import Foundation

protocol TransactionsContainerRepository {
    func initialize() async -> [TransactionsContainer]
    func getAllTransactionsContainer() -> [TransactionsContainer]
    func getTransactionsContainer(with id: String) -> Result<TransactionsContainer, Error>
    func saveTransactionsContainer(_ containers: [TransactionsContainer])
    func createDataBase(for user: User)
    func createContainer(containerName: TransactionsContainer) -> Bool
}

class TransactionsContainerRepositoryImpl: TransactionsContainerRepository {
    
    var remoteDataSource: TransactionsContainerRemoteDataSource = TransactionsContainerRemoteDataSourceImpl()
    var localDataSource: TransactionsContainerLocalDataSource = TransactionsContainerLocalDataSourceImpl()
    
    func initialize() async -> [TransactionsContainer] {
        localDataSource.clear()
        let containers = await remoteDataSource.getContainers()
        self.localDataSource.saveTransactionsContainer(containers)
        return containers
    }
    
    func getAllTransactionsContainer() -> [TransactionsContainer] {
        return localDataSource.getAllTransactionsContainer()
    }
    
    func getTransactionsContainer(with id: String) -> Result<TransactionsContainer, Error> {
        return localDataSource.getTransactionsContainer(with: id)
    }
    
    func saveTransactionsContainer(_ containers: [TransactionsContainer]) {
        localDataSource.saveTransactionsContainer(containers)
    }
    
    func createDataBase(for user: User) {
        self.remoteDataSource.createDataBase(for: user)
    }
    
    func createContainer(containerName: TransactionsContainer) -> Bool {
        return self.remoteDataSource.createContainer(container: containerName)
    }

}
