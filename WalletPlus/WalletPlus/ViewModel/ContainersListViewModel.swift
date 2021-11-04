//
//  WalletsViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-26.
//

import Foundation

class ContainersListViewModel: ObservableObject {
    
    @Published var containers: [TransactionsContainer] = []
    @Published var total: String = ""
    
    var getTransactionsContainerInteractor: GetTransactionsContainerInteractor = GetTransactionsContainerInteractorImpl()
    var amountFormatterInteractor: AmountFormatterInteractor = AmountFormatterInteractorImpl()
    
    func initialize() async {
        await self.getTransactionsContainer()
    }
    
    func getTransactionsContainer() async {
        self.containers = await self.getTransactionsContainerInteractor.execute()
        self.getTotalFromContainers()
    }
    
    func getTotalFromContainers() {
        var total: Double = 0
        for container in self.containers {
            total += container.currentAmount()
        }
        self.total = amountFormatterInteractor.format(value: total)
    }
}
