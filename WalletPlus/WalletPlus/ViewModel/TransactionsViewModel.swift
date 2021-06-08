//
//  TransactionsViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

class TransactionsViewModel: ObservableObject {
    
    var getDatesInteractor: GetDates = GetDatesInteractor()
    var getTransactionsContainerInteractor = GetTransactionsContainerInteractorImpl(dataSource: TransactionsContainerRemoteDataSourceImpl())
    
    @Published var transactionListSection: [TransactionListSection] = []

    init() {
        getTransactionsContainerInteractor.execute { result in
            switch result {
            case .success(let containers):
                let transactions = self.getAllTransactions(from: containers)
                self.createTransactionSections(transactions: transactions)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func createTransactionSections(transactions: [Transaction]) {
        for date in self.getDatesInteractor.getDates(from: transactions) {
            let filtered = transactions.filter { $0.date == date }
            transactionListSection.append(TransactionListSection(date: format(date: date), transactions: filtered))
        }
    }
    
    private func getAllTransactions(from containers: [TransactionsContainer]) -> [Transaction] {
        var allTransactions: [Transaction] = []
        for container in containers {
            if let transactions = container.transactions {
                allTransactions.append(contentsOf: transactions)
            }
        }
        return allTransactions
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
