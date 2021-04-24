//
//  TransactionContainerOverview.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import SwiftUI

struct TransactionContainerOverview: View {
    
    @StateObject var viewModel: TransactionContainerViewModel = TransactionContainerViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Categories")
                        .padding(.top,8)
                        .padding(.leading,16)
                        .font(.headline)
                    Spacer()
                }
                
                SegmentedControlView(viewModel: self.viewModel).padding(.horizontal)

                HStack {
                    Text("Transactions")
                    Spacer()
                }.padding(.horizontal)
                
                ForEach(viewModel.currentTransactions, id: \.remoteId) { transaction in
                    TransactionRow(transaction: transaction).padding(.horizontal)
                }.padding(.top,4)

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(viewModel.getContainerAvailableAmount()).font(.headline)
                    Text("Total").font(.subheadline)
                    }
                }
            })
        }
    }
}

struct TransactionContainerOverview_Previews: PreviewProvider {
    static var previews: some View {
        TransactionContainerOverview()
    }
}
