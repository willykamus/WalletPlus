//
//  TransactionsViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation
import Firebase

class TransactionsViewModel: ObservableObject {
    
    var selectedContainer: TransactionsContainer?
    var getDatesInteractor: GetDates = GetDatesInteractor()
    var getTransactionsContainerInteractor = GetTransactionsContainerInteractorImpl()
    var getTransactionsFromContainerInteractor: GetTransactionsFromContainerInteractor = GetTransactionsFromContainerInteractorImpl()
    var getTransactionsInteractor: GetTransactionsInteractor = GetTransactionsInteractorImpl()
    var getAllTransactionsInteractor: GetAllTransactionsInteractor = GetAllTransactionsInteractorImpl()
    var deleteTransactionInteractor: DeleteTransactionInteractor = DeleteTransactionInteractorImpl()

    @Published var transactionListSection: [TransactionListSection] = []
    
    func initialize() {
        if selectedContainer != nil {
            getTransactionsFromContainerInteractor.execute(for: selectedContainer!) { result in
                switch result {
                case .success(let transactions):
                    self.createTransactionSections(transactions: transactions)
                case .failure(let error):
                    return
                }
            }
        } else {
            getAllTransactionsInteractor.execute { result in
                switch result {
                case .success(let transactions):
                    self.createTransactionSections(transactions: transactions)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete(transaction: Transaction, completed: @escaping (Result<Bool, Error>) -> Void) {
        deleteTransactionInteractor.execute(transaction: transaction) { result in
            switch result {
            case .success(_):
                if self.selectedContainer != nil {
                    self.getTransactionsFromContainerInteractor.execute(for: self.selectedContainer!) { result in
                        switch result {
                        case .success(let transactions):
                            self.createTransactionSections(transactions: transactions)
                        case .failure(_):
                            return
                        }
                    }
                } else {
                    self.getAllTransactionsInteractor.execute { result in
                        switch result {
                        case .success(let transactions):
                            self.createTransactionSections(transactions: transactions)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(_):
                break
            }
            completed(result)
        }
    }

    private func createTransactionSections(transactions: [Transaction]) {
        transactionListSection.removeAll()
        transactionListSection = []
        for date in self.getDatesInteractor.getDates(from: transactions) {
            let filtered = transactions.filter {
                Calendar.current.isDate($0.date, equalTo: date, toGranularity: .day) /*$0.date == date*/ }
            transactionListSection.append(TransactionListSection(date: format(date: date), transactions: filtered))
        }
    }
    
    private func format(date currentDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        return dateFormatter.string(from: currentDate)
    }

}

struct TransactionListSection: Identifiable {
    var id: UUID = UUID()
    var date: String
    var transactions: [Transaction]
}
