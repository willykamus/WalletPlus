//
//  WalletsViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-04-26.
//

import Foundation

class WalletsViewModel: ObservableObject {
    
    @Published var containers: [TransactionContainer] = []
    
    var interactor: GetContainerAmount = ContainerInteractor()
    
    init() {
        self.containers = TestData().testData
    }
    
    func getTotal(from container: TransactionContainer) -> String {
        let total = interactor.getContainerTotalAmount(from: container)
        return ValueFormatterInteractor().format(total)
    }
    
    func getTotalFromContainers() -> String {
        var total: Double = 0
        for container in containers {
            total += interactor.getContainerTotalAmount(from: container)
        }
        return ValueFormatterInteractor().format(total)
    }
    
    
}
