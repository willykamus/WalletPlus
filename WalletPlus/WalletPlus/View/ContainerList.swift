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
        Text("Hello")
//        NavigationView {
//            List {
//                ForEach(viewModel.containers, id: \.id) { container in
//                    NavigationLink(
//                        destination: TransactionsListView(container: container),
//                        label: {
//                            VStack {Text(container.name)
//                                Text(viewModel.total)}
//
//                        })
//                .navigationBarTitle(viewModel.getTotalFromContainers())
//                .navigationBarTitleDisplayMode(.inline)
//                }
//
//            }
    }
//            List() {
//                ForEach(viewModel.containers, id: \.id) { container in
//                    NavigationLink(
//                        destination: TransactionsListView(container: container),
//                        label: {
//                            VStack(alignment: .leading) {
//                                Text(container.name)
//                                Text(viewModel.total)
//                            }
//                        })
//                }
//            }
//            .navigationBarTitle(viewModel.getTotalFromContainers())
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
}

struct ContainerList_Previews: PreviewProvider {
    static var previews: some View {
        ContainerList()
    }
}
