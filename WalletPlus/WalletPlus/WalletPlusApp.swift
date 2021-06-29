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
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        FirebaseApp.configure()
//        let data = GetTransactionsContainerInteractorImpl(dataSource: TransactionsContainerLocalDataSourceImpl())
//        data.execute { result in
//            switch result {
//            case .success(let containers):
//                print(containers)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        return true
    }
}
