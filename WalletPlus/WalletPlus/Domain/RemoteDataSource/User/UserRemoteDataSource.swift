//
//  UserRemoteDataSource.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-26.
//

import Foundation
import Firebase


protocol UserRemoteDataSource {
    func save(email: String, password: String) async -> Result<User,Error>
    func authenticate(email: String, password: String) async -> Result<User,Error>
}

class UserRemoteDataSourceImpl: UserRemoteDataSource {
    func save(email: String, password: String) async -> Result<User,Error> {
        do {
            let userData = try await Auth.auth().createUser(withEmail: email, password: password)
            return .success(User(id: userData.user.uid, email: email, password: password))
        } catch {
            return .failure(error)
        }
    }
    
    func authenticate(email: String, password: String) async -> Result<User,Error> {
        do {
            let userData = try await Auth.auth().signIn(withEmail: email, password: password)
            return .success(User(id: userData.user.uid, email: email, password: password))
        } catch {
            return .failure(error)
        }
    }
}
