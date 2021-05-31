//
//  FloatingButton.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-10.
//

import SwiftUI

struct FloatingButton: View {

    var body: some View {
        VStack {
            Text("+ Create")
                .foregroundColor(Color.white)
                .padding(.horizontal,12)
                .padding(.vertical, 6)
        }
        .background(Color.blue)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
