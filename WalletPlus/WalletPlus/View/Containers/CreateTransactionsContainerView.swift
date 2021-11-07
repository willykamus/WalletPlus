//
//  CreateTransactionsContainerView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-11-04.
//

import SwiftUI

struct CreateTransactionsContainerView: View {
    
    @State var name: String = ""
    @State var initialAmount: String = ""
    @Binding var dismiss: Bool
    
    @ObservedObject var viewModel: CreateTransactionsContainerViewModel = CreateTransactionsContainerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {

                    Section {
                        TextField("", text: self.$viewModel.containerName)
                    } header: {
                        Text("Wallet name")
                    }
                    Section {
                        TextField("", text: self.$viewModel.startingAmount).keyboardType(.numberPad)
                    } header: {
                        Text("Starting Amount")
                    }
                    
                    Button {
                        let result = viewModel.createTransactionsContainer()
                        if result {
                            self.dismiss.toggle()
                        }
                    } label: {
                        Text("Save")
                    }.buttonStyle(BorderlessButtonStyle())
                    
                }.navigationTitle("Create a Wallet")
            }
        }
    }
}

struct CreateTransactionsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionsContainerView(dismiss: .constant(false))
    }
}
