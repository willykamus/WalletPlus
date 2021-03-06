//
//  TransactionContainerOverview.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-20.
//

import SwiftUI

struct TransactionContainerOverview: View {
    
    var container: TransactionsContainer
    
    @ObservedObject var viewModel: TransactionContainerViewModel
    
    init(container: TransactionsContainer) {
        self.container = container
        self.viewModel = TransactionContainerViewModel(selectedTransactionContainer: self.container)
    }
    
    var body: some View {
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
                
                ForEach(viewModel.currentCategories) { category in
                    CategoryRow(category: category).padding(.horizontal)
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

struct TransactionContainerOverview_Previews: PreviewProvider {
    static var previews: some View {
        TransactionContainerOverview(container: TransactionsContainer(id: "123", transactions: [], name: "Hello"))
    }
}
