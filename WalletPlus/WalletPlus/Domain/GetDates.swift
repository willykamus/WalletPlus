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
            let date = removeTimeFromDate(transaction.date)
            if !uniques.contains(date) {
                uniques.append(date)
            }
        }
        return uniques.sorted { $0 > $1}
    }
    
    private func removeTimeFromDate(_ date: Date) -> Date {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        return calendar.date(from: dateComponents) ?? Date()
    }
}
