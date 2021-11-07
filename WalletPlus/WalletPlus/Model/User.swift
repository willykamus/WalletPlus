//
//  User.swift
//  WalletPlus
//
//  Created by William Ching on 2021-10-26.
//

import Foundation

struct User: Identifiable, Hashable {
    var id: String
    var email: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case password = "password"
    }
}
