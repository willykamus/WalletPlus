//
//  GetCategoriesInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation

protocol GetCategoriesInteractor {
    func execute(completed: @escaping (Result<[Category], Error>) -> Void)
}

class GetCategoriesInteractorImpl: GetCategoriesInteractor {
    
    var repository: CategoryRepository = CategoryRepositoryImpl()
    
    func execute(completed: @escaping (Result<[Category], Error>) -> Void) {
        repository.getCategories { result in
            completed(result)
        }
    }
}
