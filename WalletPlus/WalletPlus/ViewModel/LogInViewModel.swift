//
//  LogInViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-30.
//

import Foundation
import SwiftUI
import Combine

class LogInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var goToMainView: Bool = false
    
    private var authenticateInteractor: AuthenticateUserInteractor = AuthenticateUserInteractorImpl(remoteDataSource: UserRemoteDataSourceImpl(), currentUserLocalDataSource: CurrentUserLocalDataSourceImpl())
    
    func authenticate() async {
        if !email.isEmpty && !password.isEmpty {
            let response = await authenticateInteractor.execute(email: email, password: password)
            switch response {
            case .success(let remoteResponse):
                if remoteResponse {
                    DispatchQueue.main.async {
                        self.goToMainView = remoteResponse
                    }
                }
            case .failure(_):
                print("Error")
            }
        }
    }
}
