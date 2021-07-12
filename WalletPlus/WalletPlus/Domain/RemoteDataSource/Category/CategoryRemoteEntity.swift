//
//  CategoryRemoteEntity.swift
//  WalletPlus
//
//  Created by William Ching on 2021-07-06.
//

import Foundation
import FirebaseFirestoreSwift

struct CategoryRemoteEntity: Codable {
    @DocumentID public var id: String?
    var name: String
    var type: String
}
