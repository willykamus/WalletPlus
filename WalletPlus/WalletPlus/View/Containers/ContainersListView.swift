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
    @State var createTransaction: Bool = false
    @ObservedObject var viewModel: ContainersListViewModel = ContainersListViewModel()
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.containers, id: \.id) { container in
                    WalletRowView(container: container)
                        .onTapGesture {
                            self.container = container
                            self.containersPresented.toggle()
                        }
                }
                .listStyle(.plain)
                .onAppear(perform: {
                    Task.init {
                        await self.viewModel.initialize()
                    }
                })
            }
            
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
                .padding(.bottom,40)
                .padding(.horizontal,20)
                
            }
        }.sheet(isPresented: self.$createTransaction) {
            
        } content: {
            CreateTransactionsContainerView(dismiss: self.$createTransaction)
        }

    }
}

struct ContainersListView_Previews: PreviewProvider {
    static var previews: some View {
        ContainersListView(container: .constant(TransactionsContainer(id: "111", transactions: [], name: "Hello")), containersPresented: .constant(true))
    }
}
