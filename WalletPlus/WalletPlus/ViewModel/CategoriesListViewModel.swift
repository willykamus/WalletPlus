//
//  CategoriesListViewModel.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-12.
//

import Foundation

class CategoriesListViewModel: ObservableObject {
    
    var getIncomeCategoriesInteractor: GetIncomeCategories = GetIncomeCategoriesImpl()
    var getExpenseCategoriesInteractor: GetExpenseCategories = GetExpenseCategoriesImpl()
    
    @Published var incomeCategories: [Category] = []
    @Published var expenseCategories: [Category] = []
    
    init() {
        self.getIncomeCategoriesInteractor.execute { result in
            switch result {
            case .success(let income):
                self.incomeCategories = income
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        self.getExpenseCategoriesInteractor.execute { result in
            switch result {
            case .success(let expense):
                self.expenseCategories = expense
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
