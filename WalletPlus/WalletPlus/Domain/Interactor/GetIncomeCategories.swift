//
//  GetIncomeCategories.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-12.
//

import Foundation

protocol GetIncomeCategories {
    func execute(completed: @escaping (Result<[Category], Error>) -> Void)
}

class GetIncomeCategoriesImpl: GetIncomeCategories {
    
    var repository: CategoryRepository = CategoryRepositoryImpl()
    
    func execute(completed: @escaping (Result<[Category], Error>) -> Void) {
        repository.getIncomeCategories { result in
            completed(result)
        }
    }
}
