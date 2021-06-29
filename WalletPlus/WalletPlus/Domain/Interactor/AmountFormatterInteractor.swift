//
//  AmountFormatterInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-07.
//

import Foundation

protocol AmountFormatterInteractor {
    func format(value: Double) -> String
}

class AmountFormatterInteractorImpl: AmountFormatterInteractor {
    
    func format(value: Double) -> String {
        return amountText(value: value)
    }
    
    private func amountFormatter(value: Double) -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: value)
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(from: number) ?? ""
    }
    
    private func amountText(value: Double) -> String {
        let string = self.amountFormatter(value: value)
        var text: String = "$\(string)"
        if value < 0 {
            text = "-$\(string)"
        }
        return text
    }
    
    
}
