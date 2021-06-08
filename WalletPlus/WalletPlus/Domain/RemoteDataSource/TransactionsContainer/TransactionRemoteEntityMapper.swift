//
//  TransactionRemoteEntityMapper.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-02.
//

import Foundation

class TransactionRemoteEntityMapper {
    func toTransaction(remoteEntity: TransactionRemoteEntity, transactionContainer: String) -> Transaction {
        return Transaction(id: remoteEntity.id ??  UUID().uuidString, amount: remoteEntity.amount, category: remoteEntity.category, date: remoteEntity.date, containerTitle: transactionContainer)
    }
}
