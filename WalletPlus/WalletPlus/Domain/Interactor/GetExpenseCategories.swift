//
//  GetExpenseCategories.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-12.
//

import Foundation

protocol GetExpenseCategories {
    func execute(completed: @escaping (Result<[Category], Error>) -> Void)
}

class GetExpenseCategoriesImpl: GetExpenseCategories {
    
    var repository: CategoryRepository = CategoryRepositoryImpl()
    
    func execute(completed: @escaping (Result<[Category], Error>) -> Void) {
        repository.getExpenseCategories { result in
            completed(result)
        }
    }
}
