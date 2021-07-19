//
//  CreateTransactionViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-09.
//

import Foundation

protocol CreateTransactionViewModelListener {
    func save(container: TransactionsContainer, category: Category, amount: String, date: Date)
}

class CreateTransactionViewModel: ObservableObject, CreateTransactionViewModelListener {

    @Published var transactionSaved: Bool = false
    @Published var categories: [Category] = []
    @Published var transactionsContainer: [TransactionsContainer] = []
    
    var saveTransactionInteractor: AddTransactionInteractor = AddTransactionInteractorImpl(dataSource: TransactionRemoteDataSourceImpl())
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
    
    func save(container: TransactionsContainer, category: Category, amount: String, date: Date) {
        let transaction: Transaction = Transaction(id: UUID.init().uuidString, amount: Double(amount) ?? 0.0, category: category.name, date: date, containerTitle: container.name)
        saveTransactionInteractor.execute(transaction: transaction, containerID: container.id) { result in
            self.transactionSaved = result
        }
    }
}
