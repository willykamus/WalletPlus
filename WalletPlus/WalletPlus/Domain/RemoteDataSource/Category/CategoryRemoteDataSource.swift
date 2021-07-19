//
//  CategoryRemoteDataSource.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol CategoryRemoteDataSource {
    func getCategories(completed: @escaping (Result<[Category], Error>) -> Void)
    func getIncomeCategories(completed: @escaping (Result<[Category], Error>) -> Void)
    func getExpenseCategories(completed: @escaping (Result<[Category], Error>) -> Void)
}

class CategoryRemoteDataSourceImpl: CategoryRemoteDataSource {

    

    let dataBase = Firestore.firestore()
    
    func getCategories(completed: @escaping (Result<[Category], Error>) -> Void) {
        dataBase.collection("categories").getDocuments { querySnapshot, error in
            if let query = querySnapshot {
                var categories: [Category] = []
                for document in query.documents {
                    do {
                        let entity = try document.data(as: CategoryRemoteEntity.self)
                        let model = CategoryRemoteEntityMapper().toCategory(entity!)
                        categories.append(model)
                    } catch {
                        completed(.failure(error))
                        return
                    }
                }
                completed(.success(categories))
                return
            }
            completed(.failure(error!))
        }
    }
    
    func getIncomeCategories(completed: @escaping (Result<[Category], Error>) -> Void) {
        dataBase.collection("categories").whereField("type", isEqualTo: "income").getDocuments { querySnapshot, error in
            if let query = querySnapshot {
                var categories: [Category] = []
                for document in query.documents {
                    do {
                        let entity = try document.data(as: CategoryRemoteEntity.self)
                        let model = CategoryRemoteEntityMapper().toCategory(entity!)
                        categories.append(model)
                    } catch {
                        completed(.failure(error))
                        return
                    }
                }
                completed(.success(categories))
                return
            }
            completed(.failure(error!))
        }
    }
    
    func getExpenseCategories(completed: @escaping (Result<[Category], Error>) -> Void) {
        dataBase.collection("categories").whereField("type", isEqualTo: "expense").getDocuments { querySnapshot, error in
            if let query = querySnapshot {
                var categories: [Category] = []
                for document in query.documents {
                    do {
                        let entity = try document.data(as: CategoryRemoteEntity.self)
                        let model = CategoryRemoteEntityMapper().toCategory(entity!)
                        categories.append(model)
                    } catch {
                        completed(.failure(error))
                        return
                    }
                }
                completed(.success(categories))
                return
            }
            completed(.failure(error!))
        }
    }
    
    
}
