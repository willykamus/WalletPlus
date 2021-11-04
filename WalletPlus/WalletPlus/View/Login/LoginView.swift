//
//  LoginView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-30.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LogInViewModel()
    @State private var presentCreateAccount: Bool = false
    
    var body: some View {
        VStack {
            Text("Log in")
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
                    await self.viewModel.authenticate()
                }
            } label: {
                HStack {
                    Text("Log in")
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding(.vertical, 12)
            
            Button {
                self.presentCreateAccount.toggle()
            } label: {
                Text("I don't have an account")
            }.fullScreenCover(isPresented: self.$presentCreateAccount) {
                
            } content: {
                CreateAccountView()
            }
            .fullScreenCover(isPresented: self.$viewModel.goToMainView) {
                
            } content: {
                HomeView()
            }

        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
