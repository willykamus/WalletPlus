//
//  AvailableContainersListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-12.
//

import SwiftUI

struct AvailableContainersListView: View {
    
    @ObservedObject var viewModel: ContainersListViewModel = ContainersListViewModel()
    @Binding var selectedContainer: TransactionsContainer?
    @Binding var containerListPresented: Bool
    
    var body: some View {
        List(viewModel.containers, id: \.self) { container in
            Button(action: {
                self.selectedContainer = container
                self.containerListPresented.toggle()
            }, label: {
                Text(container.name)
            })
        }
    }
}

struct ContainerListView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableContainersListView(selectedContainer: .constant(nil), containerListPresented: .constant(true))
    }
}
