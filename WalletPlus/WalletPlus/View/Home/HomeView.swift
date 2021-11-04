//
//  HomeView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-31.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
