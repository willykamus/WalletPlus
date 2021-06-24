//
//  CreateTransactionVIew.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-12.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @Binding var createTransactionOpened: Bool
    @State var currentContainer: TransactionsContainer?
    @State var amount: String = ""
    @State var description: String = ""
    @State var presentContainers: Bool = false
    @ObservedObject var viewModel = CreateTransactionViewModel()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            VStack {
                NavigationLink(
                    destination: ContainersListView(container: self.$currentContainer, containersPresented: $presentContainers),
                    isActive: $presentContainers,
                    label: {
                        HStack {
                            Text("Wallet").foregroundColor(.black)
                            Spacer()
                            Text(currentContainer?.name ?? "")
                        }
                    })
                TextField("Description", text: self.$description).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Amount", text: self.$amount).textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.save(containerID: currentContainer!.id, containerTitle: currentContainer!.name, category: description, amount: amount, date: Date())
                    createTransactionOpened.toggle()
                }, label: {
                    Text("Save")
                })
            }
            .padding()
        }
    }
}

struct CreateTransactionVIew_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView(createTransactionOpened: .constant(true))
    }
}
