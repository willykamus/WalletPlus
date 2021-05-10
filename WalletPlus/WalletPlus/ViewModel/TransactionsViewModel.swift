//
//  TransactionsViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

class TransactionViewModel: ObservableObject {
    
    var testData: [Transaction] = []
    var getDatesInteractor: GetDates = GetDatesInteractor()
    
    @Published var transactionListSection: [TransactionListSection] = []

    
    func createTransactionSections() {
        for date in self.getDatesInteractor.getDates(from: testData) {
            let filtered = testData.filter { $0.date == date }
            transactionListSection.append(TransactionListSection(date: format(date: date), transactions: filtered))
        }
    }
    
    func getTransactions(from container: TransactionContainer?) {
        testData.removeAll()
        transactionListSection.removeAll()
        if container != nil {
            self.testData = container!.transactions
        } else {
            self.testData = GetTransactionsInteractor().getTransactions(from: TestData().testData)
        }
        self.createTransactionSections()
    }
    
//    private func getUniqueDates() -> [Date] {
//        var uniques: [Date] = []
//        for transaction in testData {
//            if !uniques.contains(transaction.date) {
//                uniques.append(transaction.date)
//            }
//        }
//        return uniques
//    }
    
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
