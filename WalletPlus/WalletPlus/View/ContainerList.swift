//
//  ContainerList.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-26.
//

import SwiftUI

struct ContainerList: View {
    
    @ObservedObject var viewModel: ContainersListViewModel = ContainersListViewModel()
    @State var createTransaction: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
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
                .listStyle(.plain)
                .listRowInsets(EdgeInsets())
                .onAppear(perform: {
                    Task.init {
                        await viewModel.initialize()
                    }
                })
                .navigationBarTitle(viewModel.total)
                .navigationBarTitleDisplayMode(.inline)
                .navigationViewStyle(StackNavigationViewStyle())
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.createTransaction.toggle()
                        }, label: {
                            FloatingButton()
                        })
                    }
                    .padding(.bottom,20)
                    .padding(.horizontal,20)
                    
                }
            }.sheet(isPresented: self.$createTransaction) {
                Task.init {
                    await viewModel.initialize()
                }
            } content: {
                CreateTransactionsContainerView(dismiss: self.$createTransaction)
            }
        }
    }

}

struct ContainerList_Previews: PreviewProvider {
    static var previews: some View {
        ContainerList()
    }
}
