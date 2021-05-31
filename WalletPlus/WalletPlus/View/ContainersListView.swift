//
//  ContainersListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-31.
//

import SwiftUI

struct ContainersListView: View {
    
    @Binding var container: TransactionContainer?
    @Binding var containersPresented: Bool
    @ObservedObject var viewModel: WalletsViewModel = WalletsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.containers, id: \.id) { container in
                WalletRowView(container: container)
                    .onTapGesture {
                        print("Hello")
                        self.container = container
                        self.containersPresented.toggle()
                    }
            }
        }
    }
}

struct ContainersListView_Previews: PreviewProvider {
    static var previews: some View {
        ContainersListView(container: .constant(Wallet(name: "Hello", transactions: [])), containersPresented: .constant(true))
    }
}
