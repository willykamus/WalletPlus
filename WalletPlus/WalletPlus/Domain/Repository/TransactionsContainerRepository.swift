//
//  TransactionsContainerRepository.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-24.
//

import Foundation

protocol TransactionsContainerRepository {
    func initialize(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void)
    func getAllTransactionsContainer() -> [TransactionsContainer]
    func getTransactionsContainer(with id: String) -> Result<TransactionsContainer, Error>
    func saveTransactionsContainer(_ containers: [TransactionsContainer])
}

class TransactionsContainerRepositoryImpl: TransactionsContainerRepository {
    
    var remoteDataSource: TransactionsContainerRemoteDataSource = TransactionsContainerRemoteDataSourceImpl()
    var localDataSource: TransactionsContainerLocalDataSource = TransactionsContainerLocalDataSourceImpl()
    
    func initialize(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void){
        localDataSource.clear()
        remoteDataSource.getContainers { result in
            switch result {
            case .success(let containers):
                self.localDataSource.saveTransactionsContainer(containers)
            case .failure(_):
                break
            }
            completed(result)
        }
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

}
