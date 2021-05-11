//
//  CreateTransaction.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-10.
//

import Foundation

protocol CreateTransaction {
    func createTransaction(amount: Double, category: String, date: Date?, container: TransactionContainer) -> Transaction
}

class CreateContainerInteractor: CreateTransaction {
    func createTransaction(amount: Double, category: String, date: Date?, container: TransactionContainer) -> Transaction {
        let id: String = UUID().uuidString
        let date: Date = date ?? Date()
        if amount < 0 {
            return ExpenseTransaction(containerTitle: container.name, date: date, remoteId: id, amount: amount, category: category)
        } else {
            return IncomeTransaction(containerTitle: container.name, date: date, remoteId: id, amount: amount, category: category)
        }
    }
}
