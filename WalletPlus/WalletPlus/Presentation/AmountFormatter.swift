//
//  AmountFormatter.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-28.
//

import Foundation

protocol ValueFormatter {
    func format(_ value: Double) -> String
}

class ValueFormatterInteractor: ValueFormatter {
    func format(_ value: Double) -> String {
        return amountText(value)
    }
    
    private func amountFormatter(_ value: Double) -> String {
        var amount: Double = value
        if value < 0 {
            amount = amount * -1
        }
        let formatter = NumberFormatter()
        let number = NSNumber(value: amount)
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(from: number) ?? ""
    }
    
    private func amountText(_ value: Double) -> String {
        return value < 0 ? "-$\(self.amountFormatter(value))" : "$\(self.amountFormatter(value))"
    }
    
    
}
