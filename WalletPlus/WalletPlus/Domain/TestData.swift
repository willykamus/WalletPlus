//
//  TestData.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-25.
//

import Foundation

struct TestData {
    var testData: [TransactionContainer] = [Wallet(name: "Cartera", transactions: [IncomeTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 40000000), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "3", amount: -33.2, category: "Car"), ExpenseTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "4", amount: -70.5, category: "Car")]), Wallet(name: "Cuenta", transactions: [IncomeTransaction(container: "Cuenta", date: Date(timeIntervalSinceReferenceDate: 2000000), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(container: "Cuenta", date: Date(timeIntervalSinceReferenceDate: 30000000), remoteId: "2", amount: 200, category: "FFF"), ExpenseTransaction(container: "Cuenta", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "3", amount: -33.2, category: "Car"), ExpenseTransaction(container: "Cuenta", date: Date(timeIntervalSinceReferenceDate: 2000000), remoteId: "4", amount: -100, category: "Car")])]
    
}
