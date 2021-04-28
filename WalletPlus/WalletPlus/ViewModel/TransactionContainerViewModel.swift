//
//  TransactionContainerViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

class TransactionContainerViewModel: ObservableObject {
    
    var testData: [Transaction] = TestData().testData[1].transactions!
    
    @Published var transactionContainer: TransactionContainer = Wallet(name: "Cash")
    @Published var selectedTransactionType: Int = 0 {
        didSet {
            if selectedTransactionType == 0 {
                self.currentCategories = self.getDisplayableCategories(from: self.getIncomeTransactions())
            } else {
                self.currentCategories = self.getDisplayableCategories(from: self.getExpenseTransactions())
            }
        }
    }
    @Published var currentCategories: [DisplayableCategory] = []
    
    var categoryInteractor: GetCategory = CategoryInteractor()
    
    init() {
        self.transactionContainer.transactions = testData
        self.currentCategories = self.getDisplayableCategories(from: self.getIncomeTransactions())
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
    
    func getDisplayableCategories(from transactions: [Transaction]) -> [DisplayableCategory] {
        var displayableGroups: [DisplayableCategory] = []
        let uniques: [Category] = categoryInteractor.getCategory(from: transactions)
        for category in uniques {
            var total: Double = 0
            for transaction in category.transactions {
                total += transaction.amount
            }
            displayableGroups.append(DisplayableCategory(name: category.name, amount: String(total), numberOfTransactions: category.transactions.count > 1 ? "\(category.transactions.count) transactions" : "\(category.transactions.count) transaction"))
        }
        return displayableGroups
    }
    
}
