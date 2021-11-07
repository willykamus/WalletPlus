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
    func add(transaction: TransactionRemoteEntity, to container: TransactionsContainer) async -> Bool
    func delete(transaction: TransactionRemoteEntity)
    func getTransactions(container: TransactionsContainer) async -> [Transaction]
    func getAllTransactions() async -> [Transaction]
}

class TransactionRemoteDataSourceImpl: TransactionRemoteDataSource {
    
    let dataBase = Firestore.firestore()
    private let remoteTransactionsContainer: TransactionsContainerRemoteDataSource = TransactionsContainerRemoteDataSourceImpl()
    private let currentUserLocalDataSource: CurrentUserLocalDataSource = CurrentUserLocalDataSourceImpl()
    
    func getAllTransactions() async -> [Transaction] {
        let containers = await remoteTransactionsContainer.getContainers()
        var allTransactions: [Transaction] = []
        for container in containers {
            let transactions = await self.getTransactions(container: container)
            allTransactions.append(contentsOf: transactions)
        }
        return allTransactions
    }
    
    func add(transaction: TransactionRemoteEntity, to container: TransactionsContainer) async ->  Bool {
        let user = currentUserLocalDataSource.get()
        let reference = Firebase.database.collection("users").document(user.id).collection("transactionsContainers").document(container.id).collection("transactions")
        do {
            _ = try reference.addDocument(from: transaction)
            return true
        } catch {
            return false
        }
    }
    
    func delete(transaction: TransactionRemoteEntity) {
        let user = currentUserLocalDataSource.get()
        let reference = dataBase.document(user.id).collection("transactionsContainers").document(transaction.containerId!).collection("transactions").document(transaction.id!)
        reference.delete()
    }
    
    func getTransactions(container: TransactionsContainer) async -> [Transaction] {
        let user = currentUserLocalDataSource.get()
        let reference = Firebase.database.collection("users").document(user.id).collection("transactionsContainers").document(container.id).collection("transactions")
        do {
            let query = try await reference.getDocuments()
            var transactions: [Transaction] = []
            for transaction in query.documents {
                let entity = try transaction.data(as: TransactionRemoteEntity.self)
                transactions.append(TransactionRemoteEntityMapper().toTransaction(remoteEntity: entity!))
            }
            return transactions
        } catch {
            return []
        }
    }
}


