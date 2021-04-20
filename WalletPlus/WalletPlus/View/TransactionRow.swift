//
//  TransactionRow.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI

struct TransactionRow: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack {
            
            Text("\(transaction.category)").font(.system(size: 14.0, weight: .thin))
            Spacer()
            Text(self.amountText())
                .font(.system(size: 14.0, weight: .thin))
                .foregroundColor( transaction.amount > 0 ? .green : .red)
        }
    }
    
    private func amountFormatter() -> String {
        var amount: Double = transaction.amount
        if transaction.amount < 0 {
            amount = transaction.amount * -1
        }
        let formatter = NumberFormatter()
        let number = NSNumber(value: amount)
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(from: number) ?? ""
    }
    
    private func amountText() -> String {
        var text: String = "$\(self.amountFormatter())"
        if transaction.amount < 0 {
            text = "-$\(self.amountFormatter())"
        }
        return text
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: IncomeTransaction(remoteId: "1", amount: 100.4, category: "Cash"))
    }
}
