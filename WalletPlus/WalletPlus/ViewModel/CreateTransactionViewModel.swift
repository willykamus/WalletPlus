//
//  CreateTransactionViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol CreateTransactionViewModelListener {
    func save(containerID: String, containerTitle: String, category: String, amount: String, date: Date)
}

class CreateTransactionViewModel: ObservableObject, CreateTransactionViewModelListener {

    @Published var transactionSaved: Bool = false
    
    var transactionInteractor: AddTransactionInteractor = AddTransactionInteractorImpl(dataSource: TransactionRemoteDataSourceImpl())
    
    func save(containerID: String, containerTitle: String, category: String, amount: String, date: Date) {
        let transaction: Transaction = Transaction(id: UUID.init().uuidString, amount: Double(amount) ?? 0.0, category: category, date: date, containerTitle: containerTitle)
        transactionInteractor.execute(transaction: transaction, containerID: containerID) { result in
            self.transactionSaved = result
        }
    }
    
    
}
