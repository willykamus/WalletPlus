//
//  UserValidator.swift
//  WalletPlus
//
//  Created by William Ching on 2021-11-03.
//

import Foundation

final class UserValidator {
    static func isValid(user: User) -> Bool {
        return !user.id.isEmpty && !user.email.isEmpty && !user.password.isEmpty
    }
}
