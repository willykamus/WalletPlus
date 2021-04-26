//
//  CategoryRow.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-24.
//

import SwiftUI

struct CategoryRow: View {
    
    var category: DisplayableCategory
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(category.name).font(.headline)
                Text(category.numberOfTransactions).font(.subheadline)
            }
            Spacer()
            Text(category.amount)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: DisplayableCategory(name: "Hola", amount: "2222222.00", numberOfTransactions: "100"))
    }
}
