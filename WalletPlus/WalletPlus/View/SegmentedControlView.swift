//
//  SegmentedControlView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-21.
//

import SwiftUI

struct SegmentedControlView: View {
    
    @ObservedObject var viewModel: TransactionContainerViewModel
    
    var body: some View {
        Text("Hello World")
//        HStack(spacing: 0) {
//            Button(action: {
//                viewModel.selectedTransactionType = 0
//            }, label: {
//                VStack {
//                    Text(viewModel.getIncomeTotalAmount()).font(.headline).foregroundColor(.black).padding(.horizontal)
//                    Text("Income").font(.subheadline).foregroundColor(Color.gray)
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 8)
//                .background(viewModel.selectedTransactionType == 0 ? Color.white : Color(UIColor.systemGray5))
//                .clipShape(RoundedRectangle(cornerRadius: 12.0), style: FillStyle())
//            })
//
//            Button(action: {
//                viewModel.selectedTransactionType = 1
//            }, label: {
//                VStack {
//                    Text(viewModel.getExpenseTotalAmount()).font(.headline).foregroundColor(.black).padding(.horizontal)
//                    Text("Expenses").font(.subheadline).foregroundColor(Color.gray)
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 8)
//                .background(viewModel.selectedTransactionType == 1 ? Color.white : Color(UIColor.systemGray5))
//                .clipShape(RoundedRectangle(cornerRadius: 12.0), style: FillStyle())
//            })
//        }
//        .padding(3)
//        .background(Color(UIColor.systemGray5))
//        .clipShape(RoundedRectangle(cornerRadius: 12.0), style: FillStyle())
    }
}

struct SegmentedControlView_Previews: PreviewProvider {

    static var previews: some View {
        SegmentedControlView(viewModel: TransactionContainerViewModel(selectedTransactionContainer: TransactionsContainer(id: "123", transactions: [], name: "Hello")))
    }
}
