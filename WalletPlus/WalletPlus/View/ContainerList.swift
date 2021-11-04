//
//  ContainerList.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-26.
//

import SwiftUI

struct ContainerList: View {
    
    @ObservedObject var viewModel: ContainersListViewModel = ContainersListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.containers) { container in
                    NavigationLink(
                        destination: TransactionsListView(container: container),
                        label: {
                            VStack(alignment: .leading) {
                                Text(container.name)
                                Text(String(container.currentAmount()))
                            }
                        })
                
            }
            .listRowInsets(EdgeInsets())
            .onAppear(perform: {
                Task.init {
                    await viewModel.initialize()
                }
            })
            .navigationBarTitle(viewModel.total)
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

}

struct ContainerList_Previews: PreviewProvider {
    static var previews: some View {
        ContainerList()
    }
}
