//
//  TransactionContainerViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

class TransactionContainerViewModel: ObservableObject {
    
    var selectedTransactionContainer: TransactionsContainer
    
    @Published var selectedTransactionType: Int = 0 {
        didSet {
            self.getCategories(selectedType: self.selectedTransactionType)
        }
    }
    
    @Published var currentCategories: [DisplayableCategory] = []
    
    var categoryInteractor: GetTransactionsCategoriesInteractor = GetTransactionsCategoriesInteractorImpl()
    var incomeTransactionsInteractor: GetIncomeTransactionsFromContainerInteractor = GetIncomeTransactionsFromContainerInteractorImpl()
    var expenseTransactionsInteractor: GetExpenseTransactionsFromContainerInteractor = GetExpenseTransactionsFromContainerInteractorImpl()
    var amountFormatterInteractor: AmountFormatterInteractor = AmountFormatterInteractorImpl()
    
    init(selectedTransactionContainer: TransactionsContainer) {
        self.selectedTransactionContainer = selectedTransactionContainer
    }
    
    func getContainerAvailableAmount() -> String {
        return amountFormatterInteractor.format(value: self.selectedTransactionContainer.currentAmount())
    }
    
    func getIncomeTotalAmount() -> String {
        let transactions = self.incomeTransactionsInteractor.execute(container: self.selectedTransactionContainer)
        var total: Double = 0
        for transaction in transactions {
            total += transaction.amount
        }
        return amountFormatterInteractor.format(value: total)
    }
    
    func getExpenseTotalAmount() -> String {
        let transactions = self.expenseTransactionsInteractor.execute(container: self.selectedTransactionContainer)
        var total: Double = 0
        for transaction in transactions {
            total += transaction.amount
        }
        return amountFormatterInteractor.format(value: total)
    }
    
    private func getCategories(selectedType: Int) {
        var transactions: [Transaction]!
        if selectedType == 0 {
            transactions = self.incomeTransactionsInteractor.execute(container: self.selectedTransactionContainer)
        } else {
            transactions = self.expenseTransactionsInteractor.execute(container: self.selectedTransactionContainer)
        }
        self.currentCategories = self.getDisplayableCategories(from: transactions)
    }

    func getDisplayableCategories(from transactions: [Transaction]) -> [DisplayableCategory] {
        var displayableGroups: [DisplayableCategory] = []
        let uniques: [Category] = categoryInteractor.execute(containers: [self.selectedTransactionContainer])
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
