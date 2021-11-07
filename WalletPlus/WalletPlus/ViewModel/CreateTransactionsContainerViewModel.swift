//
//  CreateTransactionsContainerViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-11-04.
//

import Foundation

class CreateTransactionsContainerViewModel: ObservableObject {
    
    @Published var containerName: String = ""
    @Published var startingAmount: String = ""
    
    let createTransactionsContainerInteractor: CreateTransactionsContainerInteractor = CreateTransactionsContainerInteractorImpl()
    
    func createTransactionsContainer() -> Bool {
        return self.createTransactionsContainerInteractor.execute(containerName: self.containerName, startingAmount: self.startingAmount)
    }
    
}
