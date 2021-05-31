//
//  ContainersListView.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-31.
//

import SwiftUI

struct ContainersListView: View {
    
    @ObservedObject var viewModel: WalletsViewModel = WalletsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.containers, id: \.id) { container in
                WalletRowView(container: container)
            }
        }
    }
}

struct ContainersListView_Previews: PreviewProvider {
    static var previews: some View {
        ContainersListView()
    }
}
