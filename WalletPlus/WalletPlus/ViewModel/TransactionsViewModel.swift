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
    @Published var displayNoTransactionMessage: Bool = false
    
    func initialize() async {
        if selectedContainer != nil {
            let transactions = await getTransactionsFromContainerInteractor.execute(for: selectedContainer!)
            DispatchQueue.main.async {
                if self.isTransactionsAvailable(transactions) {
                    self.displayNoTransactionMessage = false
                    self.createTransactionSections(transactions: transactions)
                }
            }
        } else {
            let transactions = await getAllTransactionsInteractor.execute()
            DispatchQueue.main.async {
                if self.isTransactionsAvailable(transactions) {
                    self.displayNoTransactionMessage = false
                    self.createTransactionSections(transactions: transactions)
                }
            }
        }
    }
    
    func delete(transaction: Transaction) async {
        self.deleteTransactionInteractor.execute(transaction: transaction)
        if selectedContainer != nil {
            let transactions =  await self.getTransactionsFromContainerInteractor.execute(for: selectedContainer!)
            if self.isTransactionsAvailable(transactions) {
                self.displayNoTransactionMessage = false
                self.createTransactionSections(transactions: transactions)
            }
        } else {
            let transactions = await self.getAllTransactionsInteractor.execute()
            if self.isTransactionsAvailable(transactions) {
                self.displayNoTransactionMessage = false
                self.createTransactionSections(transactions: transactions)
            }
        }
    }
    
    private func isTransactionsAvailable(_ transactions: [Transaction]) -> Bool {
        if transactions.count > 0 {
            return true
        }
        self.displayNoTransactionMessage = true
        return false
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
