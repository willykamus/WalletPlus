//
//  CreateAccountView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-29.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @ObservedObject var viewModel = CreateUserViewModel()
    
    var body: some View {
        VStack {
            
            Text("Create your account")
            
            Group {
                TextField("Enter your email", text: self.$viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                SecureField("Enter your password", text: self.$viewModel.password)
            }
            .padding(12)
            .background(Color.gray.brightness(0.4))
            .cornerRadius(8)
            
            
            Button {
                Task.init {
                    await self.viewModel.createAccount()
                }
            } label: {
                HStack {
                    Text("Create Account")
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding(.vertical, 12)
            .fullScreenCover(isPresented: self.$viewModel.accountCreated) {
                print("Dismiss")
            } content: {
                HomeView()
            }


        }.padding()
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
