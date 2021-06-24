//
//  TransactionsContainerRemoteEntity.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-02.
//

import Foundation
import FirebaseFirestoreSwift

struct TransactionsContainerRemoteEntity: Codable {
    @DocumentID public var id: String?
    var name: String
}
