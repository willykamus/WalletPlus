//
//  TransactionContainerViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

class TransactionContainerViewModel: ObservableObject {
    
    var testData: [Transaction] = [IncomeTransaction(date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(date: Date(timeIntervalSinceReferenceDate: 10000000), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "3", amount: -33.2, category: "Car")]
    
    @Published var transactionContainer: TransactionContainer = Wallet(name: "Cash")
    @Published var selectedTransactionType: Int = 0 {
        didSet {
            if selectedTransactionType == 0 {
                self.currentTransactions = getIncomeTransactions()
            } else {
                self.currentTransactions = getExpenseTransactions()
            }
        }
    }
    @Published var currentTransactions: [Transaction] = []
    
    init() {
        self.transactionContainer.transactions = testData
    }
    
    func getContainerAvailableAmount() -> String {
        return self.amountText()
    }
    
    
    private func amountFormatter() -> String {
        var amount: Double = transactionContainer.currentAmount()
        if amount < 0 {
            amount = amount * -1
        }
        let formatter = NumberFormatter()
        let number = NSNumber(value: amount)
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(from: number) ?? ""
    }
    
    private func amountText() -> String {
        var text: String = "$\(self.amountFormatter())"
        if transactionContainer.currentAmount() < 0 {
            text = "-$\(self.amountFormatter())"
        }
        return text
    }
    
    func getIncomeValue() -> String {
        let transactions = self.getIncomeTransactions()
        let total = transactions.reduce(0) { $0 + $1.amount}
        return String(total)
    }
    
    func getExpenseValue() -> String {
        let transactions = self.getExpenseTransactions()
        let total = transactions.reduce(0) { $0 + $1.amount}
        return String(total)
    }
    
    func getIncomeTransactions() -> [Transaction] {
        return self.testData.filter( { $0 is IncomeTransaction })
    }
    
    func getExpenseTransactions() -> [Transaction] {
        return self.testData.filter( { $0 is ExpenseTransaction })
    }
    
}
