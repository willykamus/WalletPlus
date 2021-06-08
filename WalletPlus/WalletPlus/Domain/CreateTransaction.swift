//
//  CreateTransaction.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-10.
//

import Foundation

protocol CreateTransaction {
    func createTransaction(amount: Double, category: String, date: Date?, container: TransactionsContainer) -> Transaction
}

class CreateContainerInteractor: CreateTransaction {
    func createTransaction(amount: Double, category: String, date: Date?, container: TransactionsContainer) -> Transaction {
        let date: Date = date ?? Date()
        return Transaction(id: UUID().uuidString, amount: amount, category: "", date: date, containerTitle: container.name)
    }
}
