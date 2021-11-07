//
//  CategoryRepository.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation

protocol CategoryRepository {
    func getCategories() async -> [Category]
    func getIncomeCategories(completed: @escaping (Result<[Category], Error>) -> Void)
    func getExpenseCategories(completed: @escaping (Result<[Category], Error>) -> Void)
}

class CategoryRepositoryImpl: CategoryRepository {

    var remoteDataSource: CategoryRemoteDataSource = CategoryRemoteDataSourceImpl()
    
    func getCategories() async -> [Category] {
        return await remoteDataSource.getCategories()
    }
    
    func getIncomeCategories(completed: @escaping (Result<[Category], Error>) -> Void) {
        remoteDataSource.getIncomeCategories { result in
            completed(result)
        }
    }
    
    func getExpenseCategories(completed: @escaping (Result<[Category], Error>) -> Void) {
        remoteDataSource.getExpenseCategories { result in
            completed(result)
        }
    }
}
