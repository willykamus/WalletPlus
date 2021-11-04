//
//  CreateTransactionViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol CreateTransactionViewModelListener {
    func save(container: TransactionsContainer, category: Category, amount: String, date: Date) async -> Bool
}

class CreateTransactionViewModel: ObservableObject, CreateTransactionViewModelListener {

    @Published var transactionSaved: Bool = false
    @Published var categories: [Category] = []
    @Published var transactionsContainer: [TransactionsContainer] = []
    @Published var allInputsValidated: Bool = false
    
    var saveTransactionInteractor: SaveTransactionInteractor = SaveTransactionInteractorImpl(repository: TransactionsRepositoryImpl())
    var getCategoriesInteractor: GetCategoriesInteractor = GetCategoriesInteractorImpl()
    var getTransactionsContainerInteractor: GetTransactionsContainerInteractor = GetTransactionsContainerInteractorImpl()
    
    func initialize() async {
        self.transactionsContainer = await self.getTransactionsContainerInteractor.execute()
        self.categories = await self.getCategoriesInteractor.execute()
    }
    
    func validateInputData(container: TransactionsContainer?, category: Category?, amount: String?) {
        if container != nil && category != nil && !(amount?.isEmpty ?? true) {
            self.allInputsValidated = true
        } else {
            self.allInputsValidated = false
        }
    }
    
    func save(container: TransactionsContainer, category: Category, amount: String, date: Date) async -> Bool {
        let transaction: Transaction = Transaction(id: UUID.init().uuidString, amount: Double(amount) ?? 0.0, category: category.name, date: date, containerId: container.id)
        return await self.saveTransactionInteractor.execute(transaction: transaction, in: container)
    }
}
