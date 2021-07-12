//
//  TransactionContainerViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import Foundation

class TransactionContainerViewModel: ObservableObject {
    
    var selectedTransactionContainer: TransactionsContainer
    
    @Published var currentCategories: [DisplayableCategory] = []
    
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
    
}
