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
                TransactionContainerOverview()
                TransactionView()
                    .tabItem {
                        Text("Transactions")
                        Image(systemName: "list.bullet.rectangle")
                    }
            }
        }
    }
}
