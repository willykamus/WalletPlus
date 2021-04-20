//
//  TransactionSectionView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import SwiftUI

struct TransactionSectionView: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
        }
        .font(.system(size: 12.0, weight: .thin))
    }
}

struct TransactionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSectionView(text: "16 April")
    }
}
