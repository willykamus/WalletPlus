//
//  TransactionRemoteEntity.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-02.
//

import Foundation
import FirebaseFirestoreSwift

struct TransactionRemoteEntity: Codable {
    @DocumentID public var id: String?
    var amount: Double
    var category: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case amount
        case date
    }
}
