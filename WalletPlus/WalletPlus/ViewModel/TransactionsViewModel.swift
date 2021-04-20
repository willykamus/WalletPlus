//
//  TransactionsViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import Foundation

class TransactionViewModel: ObservableObject {
    
    var testData: [Transaction] = [IncomeTransaction(date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(date: Date(timeIntervalSinceReferenceDate: 10000000), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "3", amount: -33.2, category: "Car")]
    
    @Published var transactionListSection: [TransactionListSection] = []
    
    init() {
        createTransactionSections()
    }
    
    func createTransactionSections() {
        for date in getUniqueDates() {
            let filtered = testData.filter { $0.date == date }
            transactionListSection.append(TransactionListSection(date: format(date: date), transactions: filtered))
        }
    }
    
    private func getUniqueDates() -> [Date] {
        var uniques: [Date] = []
        for transaction in testData {
            if !uniques.contains(transaction.date) {
                uniques.append(transaction.date)
            }
        }
        return uniques
    }
    
    private func format(date currentDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: currentDate)
    }
    
}

struct TransactionListSection: Identifiable {
    var id: UUID = UUID()
    var date: String
    var transactions: [Transaction]
}
