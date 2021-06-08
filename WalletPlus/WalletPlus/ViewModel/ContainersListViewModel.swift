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
    
    var getTransactionsContainerInteractor: GetTransactionsContainerInteractor = GetTransactionsContainerInteractorImpl(dataSource: TransactionsContainerRemoteDataSourceImpl())
    var amountFormatterInteractor: AmountFormatterInteractor = AmountFormatterInteractorImpl()
    
    init() {
        self.getTransactionsContainer()
    }
    
    func getTransactionsContainer() {
        getTransactionsContainerInteractor.execute { result in
            switch result {
            case .success(let containers):
                self.containers = containers
                self.getTotalFromContainers()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTotalFromContainers() {
        var total: Double = 0
        for container in self.containers {
            total += container.currentAmount()
        }
        self.total = amountFormatterInteractor.format(value: total)
    }
}
