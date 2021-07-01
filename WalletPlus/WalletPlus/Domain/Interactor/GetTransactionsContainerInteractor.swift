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

    let repository: TransactionsContainerRepository = TransactionsContainerRepositoryImpl()

    func execute(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void) {
        repository.initialize { result in
            completed(result)
        }
    }
    
}
