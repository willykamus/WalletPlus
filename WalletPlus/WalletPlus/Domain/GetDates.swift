//
//  GetDates.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-10.
//

import Foundation

protocol GetDates {
    func getDates(from transactions: [Transaction]) -> [Date]
}

class GetDatesInteractor: GetDates {
    func getDates(from transactions: [Transaction]) -> [Date] {
        var uniques: [Date] = []
        for transaction in transactions {
            if !uniques.contains(transaction.date) {
                uniques.append(transaction.date)
            }
        }
        return uniques.sorted { $0 > $1}
    }
}
