//
//  TransactionsContainerRemoteDataSource.swift
//  WalletPlus
//
//  Created by William Ching on 2021-05-31.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol TransactionsContainerRemoteDataSource {
    func getContainers() async -> [TransactionsContainer]
    func createDataBase(for user: User)
    func createContainer(container: TransactionsContainer) -> Bool
}

class TransactionsContainerRemoteDataSourceImpl: TransactionsContainerRemoteDataSource {

    let dataBase = Firebase.database
    let dispatchGroup = DispatchGroup()
    private let currentUserLocalDataSource: CurrentUserLocalDataSource = CurrentUserLocalDataSourceImpl()
    
    private func getTransactions(from document: DocumentSnapshot, container: TransactionsContainer) async -> [Transaction] {
        do {
            var transactions: [Transaction] = []
            let query = try await document.reference.collection("transactions").getDocuments()
            for transaction in query.documents {
                let entity = try transaction.data(as: TransactionRemoteEntity.self)
                transactions.append(TransactionRemoteEntityMapper().toTransaction(remoteEntity: entity!))
            }
            return transactions
        } catch {
            return []
        }
    }
    
    func getContainers() async -> [TransactionsContainer] {
        var containers: [TransactionsContainer] = []
        let user  = currentUserLocalDataSource.get()
        let id: String = user.id
        let reference = Firebase.database.collection("users").document(id).collection("transactionsContainers")
        do {
            let query = try await reference.getDocuments()
            for document in query.documents {
                let remoteEntity = try document.data(as: TransactionsContainerRemoteEntity.self)
                var container = TransactionsContainerRemoteEntityMapper().toTransactionContainer(remoteEntity: remoteEntity!)
                let transactions = await self.getTransactions(from: document, container: container)
                container.transactions = transactions
                containers.append(container)
            }
            return containers
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func createDataBase(for user: User) {
        dataBase.collection("users").document(user.id).setData(["id" : user.id])
    }
    
    func createContainer(container: TransactionsContainer) -> Bool {
        let user  = currentUserLocalDataSource.get()
        let entity = TransactionsContainerRemoteEntityMapper().toRemoteEntity(object: container)
        let entityId: String = entity.id!
        do {
            try Firebase.database.collection("users").document(user.id).collection("transactionsContainers").document(entityId).setData(from: container)
            return true
        } catch {
            return false
        }
        
    }
}
