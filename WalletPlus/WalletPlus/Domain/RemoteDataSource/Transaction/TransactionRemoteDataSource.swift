//
//  AddTransactionRemoteDataSoutce.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-08.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol TransactionRemoteDataSource {
    func add(transaction: TransactionRemoteEntity, to containerID: String, completed: @escaping (Bool) -> Void)
    func getTransactions(container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void)
    func getAllTransactions(completed: @escaping (Result<[Transaction], Error>) -> Void)
}

class TransactionRemoteDataSourceImpl: TransactionRemoteDataSource {

    let dataBase = Firestore.firestore()
    private let remoteTransactionsContainer: TransactionsContainerRemoteDataSource = TransactionsContainerRemoteDataSourceImpl()
    
    func getAllTransactions(completed: @escaping (Result<[Transaction], Error>) -> Void) {
        let dispatchGroup = DispatchGroup()
        remoteTransactionsContainer.getContainers { result in
            switch result {
            case .success(let containers):
                var allTransactions: [Transaction] = []
                for container in containers {
                    dispatchGroup.enter()
                    self.getTransactions(container: container) { result in
                        switch result {
                        case .success(let transactions):
                            allTransactions.append(contentsOf: transactions)
                        case .failure(let error):
                            completed(.failure(error))
                        }
                        dispatchGroup.leave()
                    }
                }
                dispatchGroup.notify(queue: .main) {
                    completed(.success(allTransactions))
                }
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    func add(transaction: TransactionRemoteEntity, to containerID: String, completed: @escaping (Bool) -> Void) {
        do {
            _ = try dataBase.collection("transactionContainers").document(containerID).collection("transactions").addDocument(from: transaction)
            completed(true)
        } catch {
            completed(false)
        }
    }
    
    func getTransactions(container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void) {
        dataBase.collection("transactionContainers").document(container.id).collection("transactions").getDocuments { querySnapshot, error in
            if let error = error {
                completed(.failure(error))
            }
            
            if let query = querySnapshot {
                var transactions: [Transaction] = []
                do {
                    for transaction in query.documents {
                        let entity = try transaction.data(as: TransactionRemoteEntity.self)
                        transactions.append(TransactionRemoteEntityMapper().toTransaction(remoteEntity: entity!, transactionContainer: container.name))
                    }
                    completed(.success(transactions))
                } catch {
                    completed(.failure(error))
                }
            }
        }
    }
}


