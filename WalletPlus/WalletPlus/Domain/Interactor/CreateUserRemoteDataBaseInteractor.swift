//
//  CreateUserRemoteDataBaseInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-11-03.
//

import Foundation

protocol CreateUserRemoteDataBaseInteractor {
    func execute(user: User)
}

class CreateUserRemoteDataBaseInteractorImpl: CreateUserRemoteDataBaseInteractor {
    
    let repository: TransactionsContainerRepository = TransactionsContainerRepositoryImpl()
    
    func execute(user: User) {
        repository.createDataBase(for: user)
    }
    
}
