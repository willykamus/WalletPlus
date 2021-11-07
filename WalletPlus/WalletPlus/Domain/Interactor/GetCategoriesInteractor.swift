//
//  GetCategoriesInteractor.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation

protocol GetCategoriesInteractor {
    func execute() async -> [Category]
}

class GetCategoriesInteractorImpl: GetCategoriesInteractor {
    
    var repository: CategoryRepository = CategoryRepositoryImpl()
    
    func execute() async -> [Category] {
        return await repository.getCategories()
    }
}
