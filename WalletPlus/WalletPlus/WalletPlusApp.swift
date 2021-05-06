//
//  WalletPlusApp.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI

@main
struct WalletPlusApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContainerList()
                    .tabItem {
                        Text("Wallets")
                        Image(systemName: "wallet.pass")
                    }
                TransactionsListTab()
                    .tabItem {
                        Text("Transactions")
                        Image(systemName: "list.bullet.rectangle")
                    }
            }
        }
    }
}
