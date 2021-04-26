//
//  TestData.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-25.
//

import Foundation

struct TestData {
    
    var testData: [Transaction] = [IncomeTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "1", amount: 100.4, category: "Cash"), IncomeTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 10000000), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "3", amount: -33.2, category: "Car"), ExpenseTransaction(container: "Cartera", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "4", amount: -70.5, category: "Car")]
}
