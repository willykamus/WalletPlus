//
//  CreateUserInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-26.
//

import Foundation

protocol CreateUserInteractor {
    func execute(email: String, password: String) async -> Result<Bool,Error>
}

class CreateUserInteractorImpl: CreateUserInteractor {
    
    var remoteDataSource: UserRemoteDataSource
    var currentUserLocalDataSource: CurrentUserLocalDataSource
    var createUserRemoteDataBaseInteractor: CreateUserRemoteDataBaseInteractor = CreateUserRemoteDataBaseInteractorImpl()
    
    init(remoteDataSource: UserRemoteDataSource, currentUserLocalDataSource: CurrentUserLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.currentUserLocalDataSource = currentUserLocalDataSource
    }
    
    func execute(email: String, password: String)  async -> Result<Bool,Error> {
        let result = await remoteDataSource.save(email: email, password: password)
        switch result {
        case .success(let user):
            currentUserLocalDataSource.save(user: user)
            createUserRemoteDataBaseInteractor.execute(user: user)
            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }
}
