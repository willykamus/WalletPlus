//
//  CreateTransactionVIew.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-12.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @State var amount: String = ""
    @State var description: String = ""
    @State var wallet: String
    @State var presentContainers: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            VStack {
                
                NavigationLink(
                    destination: ContainersListView(),
                    isActive: $presentContainers,
                    label: {
                        HStack {
                            Text("Wallet").foregroundColor(.black)
                            Spacer()
                            Text(self.wallet)
                        }
                    })
                TextField("Description", text: self.$description).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Amount", text: self.$amount).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
        }
    }
}

struct CreateTransactionVIew_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView(wallet: "Hello")
    }
}