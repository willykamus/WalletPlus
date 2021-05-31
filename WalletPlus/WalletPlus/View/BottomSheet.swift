//
//  BottomSheet.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-12.
//

import SwiftUI

struct BottomSheet: View {
    
    @ObservedObject var viewModel: WalletsViewModel = WalletsViewModel()
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 5)
                .padding(.bottom,2)

                VStack {
                    ForEach(viewModel.containers, id: \.id) { wallet in
                        Text(wallet.name).bold().foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12.0)
                }
//
                
            

        }
        .foregroundColor(Color.clear)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
