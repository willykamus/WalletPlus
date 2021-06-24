//
//  GetTransactionsContainerInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-03.
//

import Foundation

protocol GetTransactionsContainerInteractor {
    func execute(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void)
}

class GetTransactionsContainerInteractorImpl: GetTransactionsContainerInteractor {

    let dataSource: TransactionsContainerRemoteDataSource
    let dispatchGroup = DispatchGroup()
    
    init(dataSource: TransactionsContainerRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    func execute(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void) {
        dataSource.getContainers { result in
            completed(result)
        }
    }
    
}
