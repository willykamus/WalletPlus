//
//  WalletPlusApp.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-19.
//

import SwiftUI
import Firebase

@main
struct WalletPlusApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

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
                MoreTabView()
                    .tabItem {
                        Text("More")
                        Image(uiImage: UIImage(systemName: "ellipsis")!.imageWithoutBaseline())
                    }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
