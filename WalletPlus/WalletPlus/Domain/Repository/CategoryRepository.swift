//
//  CategoryRepository.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation

protocol CategoryRepository {
    func getCategories(completed: @escaping (Result<[Category], Error>) -> Void)
}

class CategoryRepositoryImpl: CategoryRepository {
    
    var remoteDataSource: CategoryRemoteDataSource = CategoryRemoteDataSourceImpl()
    
    func getCategories(completed: @escaping (Result<[Category], Error>) -> Void) {
        remoteDataSource.getCategories { result in
            completed(result)
        }
    }
}
