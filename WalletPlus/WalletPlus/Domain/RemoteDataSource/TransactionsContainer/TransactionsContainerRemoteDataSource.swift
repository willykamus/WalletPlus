//
//  TransactionsContainerRemoteDataSource.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-31.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol TransactionsContainerRemoteDataSource {
    func getContainers(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void)
}

class TransactionsContainerRemoteDataSourceImpl: TransactionsContainerRemoteDataSource {

    let dataBase = Firestore.firestore()
    let dispatchGroup = DispatchGroup()
    
    private func getTransactions(from document: DocumentSnapshot, container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void) {
        document.reference.collection("transactions").getDocuments { querySnapshot, error in
            if let query = querySnapshot {
                var transactions: [Transaction] = []
                do {
                    for transaction in query.documents {
                        let entity = try transaction.data(as: TransactionRemoteEntity.self)
                        transactions.append(TransactionRemoteEntityMapper().toTransaction(remoteEntity: entity!))
                    }
                    completed(.success(transactions))
                } catch {
                    completed(.failure(error))
                }
            }
        }
    }
    
    func getContainers(completed: @escaping (Result<[TransactionsContainer], Error>) -> Void) {
        var containers: [TransactionsContainer] = []
        dataBase.collection("transactionContainers").getDocuments { querySnapshot, error in
            if let query = querySnapshot {
                do {
                    for document in query.documents {
                        self.dispatchGroup.enter()
                        let remoteEntity = try document.data(as: TransactionsContainerRemoteEntity.self)
                        var container = TransactionsContainerRemoteEntityMapper().toTransactionContainer(remoteEntity: remoteEntity!)
                        self.getTransactions(from: document, container: container) { result in
                            switch result {
                            case .success(let transactions):
                                container.transactions = transactions
                                containers.append(container)
                            case .failure(let error):
                                self.dispatchGroup.leave()
                                completed(.failure(error))
                            }
                            self.dispatchGroup.leave()
                        }
                    }
                    self.dispatchGroup.notify(queue: .main) {
                        completed(.success(containers))
                    }
                } catch {
                    completed(.failure(error))
                }
            }
        }
    }
}
