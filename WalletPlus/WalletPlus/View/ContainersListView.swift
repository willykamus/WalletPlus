//
//  ContainersListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-31.
//

import SwiftUI

struct ContainersListView: View {
    
    @Binding var container: TransactionsContainer?
    @Binding var containersPresented: Bool
    @ObservedObject var viewModel: ContainersListViewModel = ContainersListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.containers, id: \.id) { container in
                WalletRowView(container: container)
                    .onTapGesture {
                        self.container = container
                        self.containersPresented.toggle()
                    }
            }.onAppear(perform: {
                viewModel.getTransactionsContainer()
            })
        }
    }
}

struct ContainersListView_Previews: PreviewProvider {
    static var previews: some View {
        ContainersListView(container: .constant(TransactionsContainer(id: "111", transactions: [], name: "Hello")), containersPresented: .constant(true))
    }
}
