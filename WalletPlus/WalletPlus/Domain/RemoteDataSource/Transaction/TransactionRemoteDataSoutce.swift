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

protocol TransactionRemoteDataSoutce {
    func add(transaction: TransactionRemoteEntity, to containerID: String, completed: @escaping (Bool) -> Void)
    func getTransactions(container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void)
}

class AddTransactionRemoteDataSoutceImpl: TransactionRemoteDataSoutce {
    
    let dataBase = Firestore.firestore()
    
    func add(transaction: TransactionRemoteEntity, to containerID: String, completed: @escaping (Bool) -> Void) {
        do {
            _ = try dataBase.collection("transactionContainers").document(containerID).collection("transactions").addDocument(from: transaction)
            completed(true)
        } catch {
            completed(false)
        }
    }
    
    func getTransactions(container: TransactionsContainer, completed: @escaping (Result<[Transaction], Error>) -> Void) {
        dataBase.collection(container.id).document().collection("transactions").getDocuments { querySnapshot, error in
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


