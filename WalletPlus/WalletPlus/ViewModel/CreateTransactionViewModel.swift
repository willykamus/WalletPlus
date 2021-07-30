//
//  CreateTransactionViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol CreateTransactionViewModelListener {
    func save(container: TransactionsContainer, category: Category, amount: String, date: Date, completed: @escaping (Bool) -> Void)
}

class CreateTransactionViewModel: ObservableObject, CreateTransactionViewModelListener {

    @Published var transactionSaved: Bool = false
    @Published var categories: [Category] = []
    @Published var transactionsContainer: [TransactionsContainer] = []
    @Published var allInputsValidated: Bool = false
    
    var saveTransactionInteractor: SaveTransactionInteractor = SaveTransactionInteractorImpl(dataSource: TransactionRemoteDataSourceImpl())
    var getCategoriesInteractor: GetCategoriesInteractor = GetCategoriesInteractorImpl()
    var getTransactionsContainerInteractor: GetTransactionsContainerInteractor = GetTransactionsContainerInteractorImpl()

    
    init() {
        getTransactionsContainerInteractor.execute { result in
            switch result {
            case .success(let containers):
                self.transactionsContainer = containers
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        getCategoriesInteractor.execute { result in
            switch result {
            case .success(let categories):
                self.categories = categories
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func validateInputData(container: TransactionsContainer?, category: Category?, amount: String?) {
        if container != nil && category != nil && !(amount?.isEmpty ?? true) {
            self.allInputsValidated = true
        } else {
            self.allInputsValidated = false
        }
    }
    
    func save(container: TransactionsContainer, category: Category, amount: String, date: Date, completed: @escaping (Bool) -> Void) {
        let transaction: Transaction = Transaction(id: UUID.init().uuidString, amount: Double(amount) ?? 0.0, category: category.name, date: date, containerTitle: container.name)
        saveTransactionInteractor.execute(transaction: transaction, containerID: container.id) { result in
            completed(result)
        }
    }
}
