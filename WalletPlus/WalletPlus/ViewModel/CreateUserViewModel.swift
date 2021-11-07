//
//  CreateUserViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-30.
//

import Foundation
import SwiftUI
import Combine

class CreateUserViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var accountCreated: Bool = false
    
    private var createUserInteractor: CreateUserInteractor = CreateUserInteractorImpl(remoteDataSource: UserRemoteDataSourceImpl(), currentUserLocalDataSource: CurrentUserLocalDataSourceImpl())
    
    func createAccount() async {
        let response = await self.createUserInteractor.execute(email: self.email, password: self.password)
        switch response {
        case .success(let responseSucess):
            DispatchQueue.main.async {
                self.accountCreated = responseSucess
            }
            case .failure(_):
                print("Error")
        }
        
    }
    
}
