//
//  TransactionContainerLocalDataSource.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-24.
//

import Foundation

protocol TransactionsContainerLocalDataSource {
    func getAllTransactionsContainer() -> [TransactionsContainer]
    func getTransactionsContainer(with id: String) -> Result<TransactionsContainer, Error>
    func saveTransactionsContainer(_ containers: [TransactionsContainer])
    func clear()
}

class TransactionsContainerLocalDataSourceImpl: TransactionsContainerLocalDataSource, ObservableObject {
    
    @Published var transactionContainers: [TransactionsContainer] = []
    
    func getAllTransactionsContainer() -> [TransactionsContainer] {
        return transactionContainers
    }
    
    func getTransactionsContainer(with id: String) -> Result<TransactionsContainer, Error> {
        if let index = self.transactionContainers.firstIndex(where: { $0.id == id }) {
            return .success(transactionContainers[index])
        }
        return .failure(TransactionContainerError.emptyContainers)
    }
    
    func saveTransactionsContainer(_ containers: [TransactionsContainer]) {
        transactionContainers.append(contentsOf: containers)
    }
    
    func clear() {
        transactionContainers.removeAll()
    }
    
    
}
